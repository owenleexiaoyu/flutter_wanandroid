import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wanandroid/brawer/browser_param.dart';
import 'package:flutter_wanandroid/common/widget/svg_icon.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';
import 'package:flutter_wanandroid/config/SvgIcons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// 展示文章或者网页的详情页
class BrowserPage extends StatefulWidget {

  final BrowserParam param;

  const BrowserPage({
    Key? key,
    required this.param
  }) : super(key: key);

  @override
  _BrowserPageState createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {

  double loadingProgress = 0.0;
  WebViewController? _webViewController;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  /// 通过系统分享将这个网页分享到其他 App
  Future<void> sharePageUrl() async {
    await Share.share(
        "看看这个网站【${widget.param.title}: ${widget.param.url}】"
    );
    Navigator.of(context).pop();
  }

  /// 在系统浏览器中打开这个网页
  void openPageInSystemBrowser() async {
    await launch(widget.param.url);
    Navigator.of(context).pop();
  }

  /// 复制页面 URL 到剪切板
  void copyPageUrlToClipboard() async {
    await Clipboard.setData(ClipboardData(text: widget.param.url));
    Fluttertoast.showToast(msg: "已复制链接到剪切板");
    Navigator.of(context).pop();
  }

  /// 刷新，重新加载网页
  void refreshPage() {
    setState(() {
      loadingProgress = 0;
    });
    _webViewController?.reload();
    Navigator.of(context).pop();
  }

  /// 点击更多按钮，展示选项底部 Sheet 弹层
  void showOptionsBottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            )
        ),
        context: context,
        elevation: 1,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.only(bottom: 20, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(leading: Icon(Icons.share),
                  title: Text("分享"),
                  onTap: () {
                    sharePageUrl();
                  },),
                Divider(height: 0,),
                ListTile(leading: SvgIcon(svgIconData: SvgIcons.chrome,),
                  title: Text("浏览器打开"),
                  onTap: () {
                    openPageInSystemBrowser();
                  },),
                Divider(height: 0,),
                ListTile(leading: Icon(Icons.copy),
                  title: Text("复制链接"),
                  onTap: () {
                    copyPageUrlToClipboard();
                  },),
                Divider(height: 0,),
                ListTile(leading: Icon(Icons.refresh),
                  title: Text("刷新页面"),
                  onTap: () {
                    refreshPage();
                  },),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(widget.param.title, style: Theme.of(context).textTheme.headline1 ,),
        backgroundColor: AppColors.lightBGPrimary,
        actions: [
          widget.param.articleId != null ?
          SizedBox(
            width: 50,
            child: InkWell(
              onTap: () {
                Fluttertoast.showToast(msg: "收藏文章");
              },
              child: Icon(Icons.star_border_outlined, color: AppColors.lightTextPrimary,),
            ),
          ) : SizedBox.shrink(),
          SizedBox(
            width: 50,
            child: InkWell(
              onTap: () {
                showOptionsBottomSheet();
              },
              child: Icon(Icons.more_vert, color: AppColors.lightTextPrimary,),
            ),
          )
        ],
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
            child: Icon(Icons.arrow_back, color: AppColors.lightTextPrimary,)),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.param.url,
            javascriptMode: JavascriptMode.unrestricted,
            onProgress: (int progress) {
              debugPrint('WebView is loading (progress : $progress%)');
              setState(() {
                loadingProgress = progress / 100.0;
              });
            },
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
          ),
          loadingProgress < 1.0 ? SizedBox(
            height: 2,
              child: LinearProgressIndicator(value: loadingProgress,)
          ) : SizedBox.shrink()
        ],
      ),
    );
  }
}
