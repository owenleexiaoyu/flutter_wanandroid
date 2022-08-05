import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/api/wan_api.dart';
import 'package:flutter_wanandroid/brawer/browser_page.dart';
import 'package:flutter_wanandroid/brawer/browser_param.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';
import 'package:flutter_wanandroid/discovery/banner/banner_bean.dart';
import 'package:get/get.dart';


class NewBannerWidget extends StatelessWidget {

  final List<BannerBean> bannerDataList;

  const NewBannerWidget({
    Key? key,
    required this.bannerDataList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      alignment: Alignment.center,
      child: bannerDataList.isEmpty ? Container(
        color: AppColors.lightBGSecondary,
      ) : PageView.builder(
          itemCount: bannerDataList.length,
          itemBuilder: (context, index) {
            BannerBean banner = bannerDataList[index];
            return InkWell(
              onTap: () {
                if (banner.title?.isEmpty == true || banner.url?.isEmpty == true) {
                  return;
                }
                var browserParam = BrowserParam(title: banner.title!, url: banner.url!);
                Get.to(BrowserPage(param: browserParam));
              },
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.network(
                    bannerDataList[index].imagePath ?? "",
                  ),
                  Container(
                      height: 30,
                      width: double.infinity,
                      color: Colors.grey.withOpacity(0.5),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(bannerDataList[index].title ?? ""))
                ],
              ),
            );
          })
    );
  }
}
