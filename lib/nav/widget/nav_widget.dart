import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/brawer/browser_page.dart';
import 'package:flutter_wanandroid/brawer/browser_param.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';
import 'package:flutter_wanandroid/nav/model/nav.dart';
import 'package:get/get.dart';

class NavWidget extends StatelessWidget {

  final Nav nav;

  const NavWidget({
    Key? key,
    required this.nav
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (nav.articles?.isEmpty == true) {
    //   return nil;
    // }
    return Material(
      elevation: 1,
      child: Container(
        padding: EdgeInsets.all(10),
        color: AppColors.lightBGPrimary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(nav.name ?? "", style: Theme
                .of(context)
                .textTheme
                .bodyText1,),
            SizedBox(height: 5,),
            Wrap(
              spacing: 8,
              runSpacing: -8,
              children: nav.articles!.map((NavArticle e) =>
                  InkWell(
                    onTap: () {
                      if (e.title?.isEmpty == true || e.link?.isEmpty == true) {
                        return;
                      }
                      final browserParam = BrowserParam(title: e.title! , url: e.link!);
                      Get.to(BrowserPage(param: browserParam));
                    },
                    child: Chip(
                      label: Text(e.title ?? ""),
                    ),
                  )).toList(),
            )
          ],
        ),
      ),
    );
  }
}
