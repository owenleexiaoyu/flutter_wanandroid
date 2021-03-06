
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/brawer/browser_page.dart';
import 'package:flutter_wanandroid/brawer/browser_param.dart';
import 'package:flutter_wanandroid/common/widget/svg_icon.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';
import 'package:flutter_wanandroid/config/SvgIcons.dart';
import 'package:flutter_wanandroid/profile/integral/integral_ranking_page.dart';
import 'package:flutter_wanandroid/profile/integral/my_integral_page.dart';
import 'package:flutter_wanandroid/profile/opensource/third_party_libs_page.dart';
import 'package:flutter_wanandroid/profile/profile_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightBGPrimary,
        title: Text(
          "我的",
          style: Theme.of(context).textTheme.headline1,
        ),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),

            Material(
              elevation: 1,
              child: Container(
                color: AppColors.lightBGPrimary,
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: AppColors.lightBGSecondary,
                          shape: BoxShape.circle
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text(
                      "登录/注册",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Spacer(),
                    Icon(Icons.chevron_right)
                  ],
                ),
              ),
            ),

            SizedBox(height: 10,),

            Material(
              elevation: 1,
              child: Column(
                children: [
                  ProfileItem(icon: Icon(Icons.check_box_outlined, size: 24,),
                    title: "我的积分", onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return MyIntegralPage();
                      }));
                    },),
                  Divider(height: 0.0, color: AppColors.lightDivider,),
                  ProfileItem(icon: Icon(Icons.check_box_outlined, size: 24,),
                    title: "积分排行", onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return IntegralRankingPage();
                      }));
                    },),
                ],
              )
            ),
            SizedBox(height: 10,),
            Material(
              elevation: 1,
              child: Column(
                children: [
                  ProfileItem(icon: Icon(Icons.add_circle_outline, size: 24,),
                    title: "我的分享", onTap: (){},),
                  Divider(height: 0.0, color: AppColors.lightDivider,),
                  ProfileItem(icon: Icon(Icons.star_border, size: 24,),
                    title: "我的收藏", onTap: (){},),
                  Divider(height: 0.0, color: AppColors.lightDivider,),
                  ProfileItem(icon: Icon(Icons.history, size: 24,),
                    title: "浏览历史", onTap: (){},),
                ],
              ),
            ),

            SizedBox(height: 10,),

            Material(
              elevation: 1,
              child: Column(
                children: [
                  ProfileItem(icon: SvgIcon(svgIconData: SvgIcons.github,),
                    title: "开源许可", onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ThirdPartyLibsPage()));
                    },),
                  Divider(height: 0.0, color: AppColors.lightDivider,),
                  ProfileItem(icon: Icon(Icons.info_outline, size: 24,),
                    title: "关于作者", onTap: (){
                      final browserParam = BrowserParam(title: "海树", url: "https://lixiaoyu.life");
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => BrowserPage(param: browserParam)));
                    },),
                  Divider(height: 0.0, color: AppColors.lightDivider,),
                  ProfileItem(icon: Icon(Icons.settings, size: 24,),
                    title: "系统设置", onTap: (){},),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
