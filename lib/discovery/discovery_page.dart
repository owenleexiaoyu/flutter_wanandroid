import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/account/login_page.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';
import 'package:flutter_wanandroid/discovery/banner/discovery_banner.dart';
import 'package:flutter_wanandroid/search/search_page.dart';

class DiscoveryPage extends StatelessWidget {
  const DiscoveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("发现", style: Theme.of(context).textTheme.headline1,),
        leading: InkWell(
            child: Icon(Icons.add, color: AppColors.lightTextPrimary,),
          onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return LoginPage();
              }));
          },
        ),
        actions: [
          SizedBox(
            width: 50,
            child: InkWell(
                child: Icon(Icons.search, color: AppColors.lightTextPrimary,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
            ),
          ),
        ],
      ),
      body: Container(
        child: BannerWidget(),
      ),
    );
  }
}
