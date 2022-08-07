import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/api/wan_api.dart';
import 'package:flutter_wanandroid/bean/article.dart';
import 'package:flutter_wanandroid/home/article_item_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class KnowledgeChapterArticleListScreen extends StatefulWidget {

  final String cid;

  const KnowledgeChapterArticleListScreen(
      this.cid,
      {Key? key}
      ) : super(key: key);

  @override
  _KnowledgeChapterArticleListScreenState createState() => _KnowledgeChapterArticleListScreenState();
}

class _KnowledgeChapterArticleListScreenState extends State<KnowledgeChapterArticleListScreen> {

  bool isLoading = true;
  List<Article> articleList = [];

  @override
  void initState() {
    super.initState();
    WanApi.getKnowledgeArticlesByCid(widget.cid, 0)
    .then((value) {
      setState(() {
        articleList = value.datas ?? [];
      });
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: "网络出错了");
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? Center(child: CircularProgressIndicator()) :
        articleList.isEmpty ? Center(child: Text("内容为空"),) :
    ListView.separated(
      itemCount: articleList.length,
      itemBuilder: (context, index) {
        return ArticleItemWidget(article: articleList[index]);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 10,);
      },
    );
  }
}
