import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_wanandroid/api/api_exception.dart';
import 'package:flutter_wanandroid/bean/article.dart';
import 'package:flutter_wanandroid/bean/name_link_bean.dart';
import 'package:flutter_wanandroid/bean/page_bean.dart';
import 'package:flutter_wanandroid/discovery/banner/banner_bean.dart';
import 'package:flutter_wanandroid/http/dio_client.dart';
import 'package:flutter_wanandroid/nav/model/nav.dart';
import 'package:flutter_wanandroid/profile/integral/model/ranking_model.dart';
import 'package:flutter_wanandroid/system/model/knowledge_chapter.dart';

class WanApi {

  /// 获取首页文章列表
  static Future<PageBean<Article>> getHomeArticles(int page) async {
    Response<String> resp = await DioClient().dio.get("https://www.wanandroid.com/article/list/$page/json");
    return compute(_parseArticleListInPage, resp.data ?? "");
  }

  /// 解析返回类型为 PageBean<Article> 的请求结果
  static PageBean<Article> _parseArticleListInPage(String source) {
    final result = json.decode(source);
    _checkResult(result);
    return PageBean.fromJson(result["data"], (articleJson) => Article().fromJson(articleJson));
  }

  static Future<List<BannerBean>> getBanners() async {
    Response<String> resp = await DioClient().dio.get("https://www.wanandroid.com/banner/json");
    return compute(_parseBanners, resp.data ?? "");
  }

  static List<BannerBean> _parseBanners(String source) {
    final result = json.decode(source);
    _checkResult(result);
    final parsed = result["data"].cast<Map<String, dynamic>>();
    return parsed.map<BannerBean>((json) => BannerBean.fromJson(json)).toList();
  }
  
  static Future<List<Nav>> getNavList() async {
    Response<String> resp = await DioClient().dio.get("https://www.wanandroid.com/navi/json");
    return compute(_parseNavList, resp.data ?? "");
  }
  
  static List<Nav> _parseNavList(String source) {
    final result = json.decode(source);
    _checkResult(result);
    final List<Object?> parsed = result["data"];
    return parsed.map((e) => Nav.fromJson(e)).toList();
  }
  
  /// 获取积分排行
  static Future<PageBean<RankingModel>> getRanking(int page) async {
    Response<String> resp = await DioClient().dio
        .get("https://www.wanandroid.com/coin/rank/$page/json");
    return compute(_parseRanking, resp.data ?? "");
  }

  static PageBean<RankingModel> _parseRanking(String source) {
    final result = json.decode(source);
    _checkResult(result);
    return PageBean.fromJson(result["data"], (rankingModelJson) => RankingModel().fromJson(rankingModelJson));
  }
  
  /// 获取常用网站
  static Future<List<NameLinkBean>> getUsefulWebsites() async {
    Response<String> resp = await DioClient().dio.get("https://www.wanandroid.com/friend/json");
    return compute(_parseNameLinkList, resp.data ?? "");
  }

  /// 解析范型为 List<NameLinkBean> 的请求结果
  static List<NameLinkBean> _parseNameLinkList(String source) {
    final result = json.decode(source);
    _checkResult(result);
    final List<Object?> parsed = result["data"];
    return parsed.map((e) => NameLinkBean().fromJson(e)).toList();
  }
  
  /// 获取知识体系下所有知识分类
  static Future<List<KnowledgeChapter>> getKnowledgeChapterList() async {
    Response<String> resp = await DioClient().dio
        .get("https://www.wanandroid.com/tree/json");
    return compute(_parseKnowledgeChapterList, resp.data ?? "");
  }

  static List<KnowledgeChapter> _parseKnowledgeChapterList(String source) {
    final result = json.decode(source);
    _checkResult(result);
    final List<Object?> parsed = result["data"];
    return parsed.map((e) => KnowledgeChapter.fromJson(e)).toList();
  }

  /// 获取知识体系二级目录下的文章列表
  static Future<PageBean<Article>> getKnowledgeArticlesByCid(
      String cid,
      int page
  ) async {
    Response<String> resp = await DioClient().dio
        .get("https://www.wanandroid.com/article/list/$page/json?cid=$cid");
    return compute(_parseArticleListInPage, resp.data ?? "");
  }
  
  /// 获取热门搜索词
  static Future<List<NameLinkBean>> getSearchHotKeywords() async {
    Response<String> resp = await DioClient().dio.get("https://www.wanandroid.com//hotkey/json");
    return compute(_parseNameLinkList, resp.data ?? "");
  }
  
  /// 搜索
  static Future<PageBean<Article>> searchByKeyword(String keyword, int page) async {
    final formData = FormData.fromMap({"k": keyword});
    Response<String> resp = await DioClient().dio.post("https://www.wanandroid.com/article/query/$page/json", data: formData);
    return _parseArticleListInPage(resp.data ?? "");
  }

  static void _checkResult(Map<String, dynamic> result) {
    if (result["errorCode"] != 0) {
      throw ApiException(code: result["errorCode"], msg: result["errorMsg"]);
    }
  }
}