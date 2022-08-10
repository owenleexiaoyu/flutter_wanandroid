import 'package:flutter_wanandroid/bean/article.dart';

class ArticleUtils {

  /// 获取文章的作者信息
  static String getAuthor(Article? article) {
    if (article == null) {
      return "";
    }
    var author = "";
    if (article.author?.isNotEmpty ?? false) {
      author = article.author!;
    } else if (article.shareUser?.isNotEmpty ?? false) {
      author = article.shareUser!;
    }
    return author;
  }
}