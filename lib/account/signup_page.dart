import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/account/login_page.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("注册"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset("assets/images/account.png", height: 200,),
          Text("WANANDROID", style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.lightTextPrimary
          ),),
          SizedBox(height: 20,),
          Form(child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "账号"
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                    hintText: "密码"
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                    hintText: "确认密码"
                ),
              ),
            ],
          )),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12),),
                  ),
                    onPressed: () {}, child: Text("注册"))),
            SizedBox(height: 5,),
            Container(
                width: double.infinity,
                child: OutlinedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12),),
                    ),
                    onPressed: () {
                      Get.to(LoginPage());
                    }, child: Text("去登录"))),
        ]
        ),
      ),
    );
  }
}
