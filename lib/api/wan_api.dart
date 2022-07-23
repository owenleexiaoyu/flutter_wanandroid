import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_wanandroid/api/api_exception.dart';
import 'package:flutter_wanandroid/bean/article.dart';
import 'package:flutter_wanandroid/bean/article_page_bean.dart';
import 'package:flutter_wanandroid/discovery/banner/banner_bean.dart';
import 'package:flutter_wanandroid/http/dio_client.dart';
import 'package:flutter_wanandroid/nav/model/nav.dart';

class WanApi {

  /// 获取首页文章列表
  static Future<ArticlePage<Article>> getHomeArticles(int page) async {
    Response<String> resp = await DioClient().dio.get("https://www.wanandroid.com/article/list/$page/json");
    return compute(parseHomeArticles, resp.data ?? "");
  }

  static ArticlePage<Article> parseHomeArticles(String source) {
    final result = json.decode(source);
    _checkResult(result);
    return ArticlePage.fromJson(result["data"], (articleJson) => Article().fromJson(articleJson));
  }

  static Future<List<BannerBean>> getBanners() async {
    Response<String> resp = await DioClient().dio.get("https://www.wanandroid.com/banner/json");
    return compute(parseBanners, resp.data ?? "");
  }

  static List<BannerBean> parseBanners(String source) {
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

  static void _checkResult(Map<String, dynamic> result) {
    if (result["errorCode"] != 0) {
      throw ApiException(code: result["errorCode"], msg: result["errorMsg"]);
    }
  }
}