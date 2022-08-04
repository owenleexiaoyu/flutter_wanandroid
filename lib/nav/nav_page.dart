import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/api/wan_api.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';
import 'package:flutter_wanandroid/nav/model/nav.dart';
import 'package:flutter_wanandroid/nav/widget/nav_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {

  bool isLoading = true;
  List<Nav> navList = [];

  @override
  void initState() {
    super.initState();
    WanApi.getNavList().then((value) {
      setState(() {
        navList = value;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString() + "\n" + stackTrace.toString());
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
        title: Text("导航", style: Theme.of(context).textTheme.headline1,),
      ),
      body: isLoading ? Center(
        child: CircularProgressIndicator(),
      ) : ListView.separated(
          itemBuilder: (context, index) {
            return NavWidget(nav: navList[index]);
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 10,);
          },
          itemCount: navList.length
      ),
    );
  }
}
