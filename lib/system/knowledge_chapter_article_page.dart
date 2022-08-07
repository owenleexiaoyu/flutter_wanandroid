import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/widget/keep_alive_wrapper.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';
import 'package:flutter_wanandroid/system/knowledge_chapter_article_list_screen.dart';
import 'package:flutter_wanandroid/system/model/knowledge_chapter.dart';

class KnowledgeChapterArticlePage extends StatefulWidget {

  final KnowledgeChapter knowledgeChapter;

  const KnowledgeChapterArticlePage(
  this.knowledgeChapter, {
    Key? key
  }) : super(key: key);

  @override
  _KnowledgeChapterArticlePageState createState() => _KnowledgeChapterArticlePageState();
}

class _KnowledgeChapterArticlePageState extends State<KnowledgeChapterArticlePage>
  with SingleTickerProviderStateMixin {

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.knowledgeChapter.children?.length ?? 0, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<KnowledgeChapter> subChapterList = widget.knowledgeChapter.children ?? [];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.knowledgeChapter.name ?? ""),
        bottom: subChapterList.isEmpty ? null : TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: AppColors.lightTextPrimary,
          tabs: subChapterList.map((e) =>
              Tab(
                text: e.name ?? "",
              )
          ).toList(),
        ),
      ),
      body: subChapterList.isEmpty ? Center(
        child: Text("内容为空"),
      ) : TabBarView(
        controller: _tabController,
          children: subChapterList.map((e) =>
              KeepAliveWrapper(child: KnowledgeChapterArticleListScreen(e.id?.toString() ?? ""))
          ).toList(),
      ),
    );
  }
}
