import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_wanandroid/api/api_exception.dart';
import 'package:flutter_wanandroid/api/wan_android_api_constants.dart';
import 'package:flutter_wanandroid/bean/article.dart';
import 'package:flutter_wanandroid/bean/article_page_bean.dart';
import 'package:flutter_wanandroid/discovery/banner/banner_bean.dart';
import 'package:flutter_wanandroid/http/dio_client.dart';

class WanApi {

  /// 获取首页文章列表
  static Future<ArticlePage<Article>> getHomeArticles(int page) async {
    Response<String> resp = await DioClient().dio.get("https://www.wanandroid.com/article/list/$page/json");
    return compute(parseHomeArticles, resp.data ?? "");
  }

  static ArticlePage<Article> parseHomeArticles(String source) {
    final result = json.decode(source);
    checkResult(result);
    return ArticlePage.fromJson(result["data"], (articleJson) => Article().fromJson(articleJson));
  }

  static Future<List<BannerBean>> getBanners() async {
    Response<String> resp = await DioClient().dio.get(WanAndroidApiConstants.BANNER_URL);
    return compute(parseBanners, resp.data ?? "");
  }

  static List<BannerBean> parseBanners(String source) {
    final result = json.decode(source);
    checkResult(result);
    final parsed = result["data"].cast<Map<String, dynamic>>();
    return parsed.map<BannerBean>((json) => BannerBean.fromJson(json)).toList();
  }

  static void checkResult(Map<String, dynamic> result) {
    if (result["errorCode"] != 0) {
      throw ApiException(code: result["errorCode"], msg: result["errorMsg"]);
    }
  }
}