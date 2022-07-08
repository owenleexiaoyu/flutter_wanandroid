import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColors.lightBGPrimary,
        title: Text("首页", style: Theme.of(context).textTheme.headline1,),
      ),
      body: Container(),
    );
  }
}
