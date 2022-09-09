import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/api/wan_api.dart';
import 'package:flutter_wanandroid/bean/article.dart';
import 'package:flutter_wanandroid/home/article_item_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isLoading = true;
  bool isLoadingMore = false; // 是否正在加载更多
  List<Article> articleList = [];
  int currentPage = 0;

  ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    fetchArticles();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) { // 滑到底部，触发加载更多
        debugPrint("滑到底部，触发加载更多");
        loadMoreArticles();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  /// 在第一次加载或者下拉刷新时调用
  void fetchArticles() {
    currentPage = 0;
    WanApi.getHomeArticles(currentPage).then((value) {
      debugPrint(value.toString());
      setState(() {
        if (value.datas?.isNotEmpty == true) {
          articleList.addAll(value.datas!);
          currentPage++;
        }
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Fluttertoast.showToast(msg: "网络出错了～");
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  /// 上拉加载更多时调用
  void loadMoreArticles() {
    if (isLoadingMore) {
      debugPrint("已经在加载更多了，你快别滑了");
      return;
    }
    setState(() {
      isLoadingMore = true;
    });
    WanApi.getHomeArticles(currentPage).then((value) {
      debugPrint(value.toString());
      setState(() {
        if (value.datas?.isNotEmpty == true) {
          articleList.addAll(value.datas!);
          currentPage++;
        }
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Fluttertoast.showToast(msg: "网络出错了～");
    }).whenComplete(() {
      setState(() {
        isLoadingMore = false;
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
      RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.separated(
            controller: _scrollController,
            itemCount: articleList.length + 1, // 把这里设为列表的长度加 1，在最后添加加载更多的提示 Widget
            itemBuilder: (context, index) {
              if (index < articleList.length) {
                return ArticleItemWidget(article: articleList[index]);
              }
              return _getLoadingMoreWidget();
            },
          separatorBuilder: (context, index) {
              return SizedBox(height: 10,);
          },
         ),
      ),
    );
  }

  Widget _getLoadingMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("加载中..."),
            SizedBox(width: 10,),
            SizedBox(
              width: 15,
                height: 15,
                child: CircularProgressIndicator(strokeWidth: 2,))
          ],
        ),
      ),
    );
  }
  
  Future<Null> _onRefresh() async {
    debugPrint("触发下拉刷新");
    articleList.clear();
    fetchArticles();
  }
}
