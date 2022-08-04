import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/brawer/browser_page.dart';
import 'package:flutter_wanandroid/brawer/browser_param.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';
import 'package:flutter_wanandroid/profile/opensource/model/libs_list.dart';
import 'package:get/get.dart';

class ThirdPartyLibsPage extends StatelessWidget {
  const ThirdPartyLibsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ThirdPartyLib> thirdPartyLibs = ThirdPartyLibs.getThirdPartyLibs();
    return Scaffold(
      appBar: AppBar(
        title: Text("开源库"),
      ),
      body: Container(
        color: AppColors.lightBGPrimary,
        child: ListView.separated(
          itemBuilder: (context, index) {
          return ListTile(
            title: Text(thirdPartyLibs[index].title,),
            subtitle: Text(thirdPartyLibs[index].link),
            onTap: () {
              final browserParam = BrowserParam(
                  title: thirdPartyLibs[index].title,
                  url: thirdPartyLibs[index].link
              );
              Get.to(BrowserPage(param: browserParam));
            },
          );
        },
          itemCount: thirdPartyLibs.length,
          separatorBuilder: (context, index) => Divider()
        ),
      ),
    );
  }
}
