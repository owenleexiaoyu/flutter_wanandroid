import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/api/wan_api.dart';
import 'package:flutter_wanandroid/bean/article.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';
import 'package:flutter_wanandroid/home/article_item_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isLoading = true;

  List<Article> articleList = [];

  @override
  void initState() {
    super.initState();

    WanApi.getHomeArticles(0).then((value) {
      debugPrint(value.toString());
      setState(() {
        articleList = value.datas ?? [];
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Fluttertoast.showToast(msg: "出错了～");
      // showToast
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
        title: Text("首页", style: Theme.of(context).textTheme.headline1,),
      ),
      body: isLoading ? Center(child: CircularProgressIndicator()) :
      ListView.separated(
          itemCount: articleList.length,
          itemBuilder: (context, index) {
            return ArticleItemWidget(article: articleList[index]);
          },
        separatorBuilder: (context, index) {
            return SizedBox(height: 10,);
        },
       ),
    );
  }
}
