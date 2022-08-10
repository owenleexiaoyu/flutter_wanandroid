import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/api/wan_api.dart';
import 'package:flutter_wanandroid/bean/article.dart';
import 'package:flutter_wanandroid/home/article_item_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchResultPage extends StatefulWidget {

  final String keyword;

  const SearchResultPage(
      this.keyword,
      {Key? key}) : super(key: key);

  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {

  List<Article> articleList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WanApi.searchByKeyword(widget.keyword, 0).then((value) {
      setState(() {
        articleList = value.datas ?? [];
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Fluttertoast.showToast(msg: "网络出错了");
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("「${widget.keyword}」的搜索结果"),
      ),
      body: isLoading ? Center(
        child: CircularProgressIndicator(),
      ) : articleList.isEmpty ? Center(
        child: Text("内容为空"),
      ) : ListView.separated(
          itemBuilder: (context, index) {
            return ArticleItemWidget(article: articleList[index]);
          }, separatorBuilder: (context, index) {
            return SizedBox(height: 10,);
      }, itemCount: articleList.length),
    );
  }
}
