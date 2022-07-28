import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';

import 'main/main_page.dart';

void main() {
  runApp(WanAndroidApp());
}

class WanAndroidApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '玩安卓',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          headline2: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 18,
          ),
          bodyText1: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 15,
            fontWeight: FontWeight.w400
          ),
          bodyText2: TextStyle(
            color: AppColors.lightTextSecondary,
            fontSize: 15
          ),
        ),
        iconTheme: IconThemeData(color: AppColors.lightTextPrimary)
      ),
      home: MainPage(),
    );
  }
}
