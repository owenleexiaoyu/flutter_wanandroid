import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/account/login_page.dart';
import 'package:flutter_wanandroid/api/wan_api.dart';
import 'package:flutter_wanandroid/bean/name_link_bean.dart';
import 'package:flutter_wanandroid/brawer/browser_page.dart';
import 'package:flutter_wanandroid/brawer/browser_param.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';
import 'package:flutter_wanandroid/discovery/banner/banner_bean.dart';
import 'package:flutter_wanandroid/search/search_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'banner/banner_widget.dart';

class DiscoveryPage extends StatefulWidget {

  const DiscoveryPage({Key? key}) : super(key: key);

  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {

  bool isLoading = true;
  List<NameLinkBean> usefulWebsites = [];
  List<BannerBean> bannerDatas = [];

  @override
  void initState() {
    super.initState();
    Future.wait([
      WanApi.getUsefulWebsites(),
      WanApi.getBanners()
    ]).then((resultList) {
      if (resultList.isNotEmpty && resultList.length > 1) {
        setState(() {
          usefulWebsites =  resultList[0].cast<NameLinkBean>();
          bannerDatas = resultList[1].cast<BannerBean>();
        });
      }
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
        title: Text("发现", style: Theme.of(context).textTheme.headline1,),
        leading: InkWell(
            child: Icon(Icons.add, color: AppColors.lightTextPrimary,),
          onTap: (){
              Get.to(LoginPage());
          },
        ),
        actions: [
          SizedBox(
            width: 50,
            child: InkWell(
                child: Icon(Icons.search, color: AppColors.lightTextPrimary,),
              onTap: (){
                Get.to(SearchPage());
              },
            ),
          ),
        ],
      ),
      body: isLoading ? Center(
        child: CircularProgressIndicator(),
      ) : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewBannerWidget(bannerDataList: bannerDatas,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("常用网站", style: Theme.of(context).textTheme.headline2),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Wrap(
                spacing: 8,
                runSpacing: -8,
                children: usefulWebsites.map((e) => InkWell(
                  onTap: () {
                    final browserParam = new BrowserParam(
                      title: e.name ?? "",
                      url: e.link ?? ""
                    );
                    Get.to(BrowserPage(param: browserParam));
                  },
                  child: Chip(
                    label: Text(e.name ?? ""),
                  ),
                )).toList(),
              ),
            )
          ]
        ),
      ),
    );
  }
}
