import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';

class NavPage extends StatelessWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColors.lightBGPrimary,
        title: Text("导航", style: Theme.of(context).textTheme.headline1,),
      ),
      body: Container(),
    );
  }
}
