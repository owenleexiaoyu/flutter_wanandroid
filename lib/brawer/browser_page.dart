import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/brawer/browser_param.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(widget.param.title, style: Theme.of(context).textTheme.headline1 ,),
        backgroundColor: AppColors.lightBGPrimary,
        actions: [
          SizedBox(
            width: 60,
            child: InkWell(
              onTap: () {
                Fluttertoast.showToast(msg: "展示 Option Sheet");
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
