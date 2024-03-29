import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/bean/article.dart';
import 'package:flutter_wanandroid/brawer/browser_page.dart';
import 'package:flutter_wanandroid/brawer/browser_param.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';
import 'package:flutter_wanandroid/utils/article_utils.dart';
import 'package:get/get.dart';
import 'package:simple_html_css/simple_html_css.dart';

class ArticleItemWidget extends StatelessWidget {

  final Article article;

  const ArticleItemWidget({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String authorText = ArticleUtils.getAuthor(article);
    return Material(
      elevation: 1,
      child: InkWell(
        onTap: () {
          if (article.title?.isEmpty == true || article.link?.isEmpty == true) {
            return;
          }
          var browserParam = BrowserParam(
              title: article.title! ,
              url: article.link!,
              articleId: article.id
          );
          Get.to(BrowserPage(param: browserParam));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          color: AppColors.lightBGPrimary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  authorText.isNotEmpty ? Text(authorText,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 13,
                  )) : SizedBox.shrink(),
                ],
              ),
              SizedBox(height: 5,),
              RichText(text: HTML.toTextSpan(context, article.title ?? "")),
              SizedBox(height: 5,),
              (article.desc?.isNotEmpty ?? false) ? Text(article.desc!, style: Theme.of(context).textTheme.bodyText2,) : SizedBox.shrink(),
              Text(article.niceDate ?? "", style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 13
              ))
            ],
          ),
        ),
      ),
    );
  }
}
