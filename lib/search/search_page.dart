import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/api/wan_api.dart';
import 'package:flutter_wanandroid/bean/name_link_bean.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';
import 'package:flutter_wanandroid/search/search_result_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchPage extends StatefulWidget {

  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  static const _SEARCH_HISTORY = "search_history";
  /// 热门搜索词列表
  List<NameLinkBean> hotKeywordList = [];
  /// 搜索历史列表
  List<String> searchHistoryList = [];

  TextEditingController? _textEditingController;
  SharedPreferences? _sp;

  @override
  void initState() {
    super.initState();
    WanApi.getSearchHotKeywords().then((value) {
      setState(() {
        hotKeywordList = value;
      });
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: "网络出错了");
    }).whenComplete(() {

    });

    _textEditingController = new TextEditingController();

    initSearchHistory();
  }

  void initSearchHistory() async {
    _sp = await SharedPreferences.getInstance();
    setState(() {
      searchHistoryList = _sp?.getStringList(_SEARCH_HISTORY) ?? [];
    });
  }

  @override
  void dispose() {
    _textEditingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: SingleChildScrollView(
          child: Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: AppColors.lightBGSecondary
            ),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: "输入关键词进行搜索",
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        actions: [
          SizedBox(
            width: 60,
            child: IconButton(
              onPressed: () {
                final searchText = _textEditingController?.text ?? "";
                if (searchText.isEmpty) {
                  Fluttertoast.showToast(msg: "请先输入搜索关键词");
                  return;
                }
                _textEditingController?.clear();
                navigatorToSearchResultPage(searchText);
              },
                icon: Icon(Icons.search)),
          )
        ],
      ),
      body: Container(
        color: AppColors.lightBGPrimary,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 6,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: AppColors.lightTextPrimary,
                  ),
                ),
                SizedBox(width: 5,),
                Text("搜索历史", style: Theme.of(context).textTheme.bodyText1),
                Spacer(),
                InkWell(
                    onTap: () {},
                    child: Icon(Icons.delete),
                  ),
              ],
            ),
            searchHistoryList.isEmpty ? Container(
              height: 40,
                alignment: Alignment.center,
                child: Text("搜索历史为空，快去搜索吧～")) :
            Wrap(
              spacing: 10,
              runSpacing: -8,
              children: searchHistoryList.map((e) =>
                  InkWell(
                    onTap: () {
                      navigatorToSearchResultPage(e);
                    }, child: Chip(label: Text(e)))
              ).toList(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Divider(height: 0.0,),
            ),
            Row(
              children: [
                Container(
                  width: 6,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: AppColors.lightTextPrimary,
                  ),
                ),
                SizedBox(width: 5,),
                Text("热门搜索", style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
            hotKeywordList.isEmpty ? SizedBox.shrink() :
                Wrap(
                  spacing: 10,
                  runSpacing: -8,
                  children: hotKeywordList.map((e) =>
                      InkWell(
                        onTap: () {
                          navigatorToSearchResultPage(e.name ?? "");
                        },
                          child: Chip(label: Text(e.name ?? "")))
                  ).toList(),
                )
          ],
        ),
      ),
    );
  }

  void navigatorToSearchResultPage(String keyword) {
    if (!searchHistoryList.contains(keyword)) {
      searchHistoryList.add(keyword);
      _sp?.setStringList(_SEARCH_HISTORY, searchHistoryList);
      setState(() {});
    }
    Get.to(SearchResultPage(keyword));
  }
}
