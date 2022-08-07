import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/api/wan_api.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';
import 'package:flutter_wanandroid/system/knowledge_chapter_article_page.dart';
import 'package:flutter_wanandroid/system/model/knowledge_chapter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class KnowledgeSystemPage extends StatefulWidget {
  const KnowledgeSystemPage({Key? key}) : super(key: key);

  @override
  _KnowledgeSystemPageState createState() => _KnowledgeSystemPageState();
}

class _KnowledgeSystemPageState extends State<KnowledgeSystemPage> {

  bool isLoading = true;
  List<KnowledgeChapter> knowledgeChapterList = [];

  @override
  void initState() {
    super.initState();
    WanApi.getKnowledgeChapterList().then((value) {
      setState(() {
        knowledgeChapterList = value;
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
    return Scaffold(
      appBar: AppBar(
        title: Text("知识体系", style: Theme.of(context).textTheme.headline1,),
      ),
      body: isLoading ? Center(
        child: CircularProgressIndicator(),
      ) : knowledgeChapterList.isEmpty ? Center(
        child: Text("内容为空"),
      ) : ListView.separated(
          itemBuilder: (context, index) {
            return Material(
              elevation: 1,
              child: InkWell(
                onTap: () {
                  Get.to(KnowledgeChapterArticlePage(knowledgeChapterList[index]));
                },
                child: Container(
                  color: AppColors.lightBGPrimary,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(knowledgeChapterList[index].name ?? "",
                        style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16),
                      ),
                      SizedBox(height: 5,),
                      Wrap(
                        spacing: 10,
                        children: knowledgeChapterList[index].children
                            ?.map((e) => Text(e.name ?? "",
                          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 14),
                        )).toList() ?? [],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 10,);
          },
          itemCount: knowledgeChapterList.length
      ),
    );
  }
}
