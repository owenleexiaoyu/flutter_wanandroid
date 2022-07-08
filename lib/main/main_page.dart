import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';
import 'package:flutter_wanandroid/discovery_page.dart';
import 'package:flutter_wanandroid/home_page.dart';
import 'package:flutter_wanandroid/knowledge_system_page.dart';
import 'package:flutter_wanandroid/nav_page.dart';
import 'package:flutter_wanandroid/profile/profile_page.dart';

class MainPage extends StatefulWidget {

  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: [
          HomePage(),
          KnowledgeSystemPage(),
          DiscoveryPage(),
          NavPage(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.lightBGPrimary,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.lightTextPrimary,
        unselectedItemColor: AppColors.lightTextTertiary,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.line_weight), label: "体系"),
          BottomNavigationBarItem(icon: Icon(Icons.layers), label: "发现"),
          BottomNavigationBarItem(icon: Icon(Icons.navigation), label: "导航"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            _controller.jumpToPage(index);
          });
        },
      ),
    );
  }
}