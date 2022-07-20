import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/bean/article.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';

class ArticleItemWidget extends StatelessWidget {

  final Article article;

  const ArticleItemWidget({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String authorText = "";
    if (article.author?.isNotEmpty ?? false) {
      authorText = article.author!;
    } else if (article.shareUser?.isNotEmpty ?? false) {
      authorText = article.shareUser!;
    }
    return Material(
      elevation: 1,
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
            Text(article.title ?? "", style: Theme.of(context).textTheme.bodyText1),
            SizedBox(height: 5,),
            (article.desc?.isNotEmpty ?? false) ? Text(article.desc!, style: Theme.of(context).textTheme.bodyText2,) : SizedBox.shrink(),
            Text(article.niceDate ?? "", style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 13
            ))
          ],
        ),
      ),
    );
  }
}
