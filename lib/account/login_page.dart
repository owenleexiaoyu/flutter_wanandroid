import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: AppColors.lightBGSecondary, shape: BoxShape.circle),
          ),
          SizedBox(height: 10,),
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
              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                    hintText: "密码"
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
                    onPressed: () {}, child: Text("登录"))),
            SizedBox(height: 5,),
            Container(
                width: double.infinity,
                child: OutlinedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12),),
                    ),
                    onPressed: () {}, child: Text("去注册"))),
        ]
        ),
      ),
    );
  }
}
