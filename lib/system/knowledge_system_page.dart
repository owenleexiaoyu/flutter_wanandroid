import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';

class KnowledgeSystemPage extends StatelessWidget {
  const KnowledgeSystemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColors.lightBGPrimary,
        title: Text("知识体系", style: Theme.of(context).textTheme.headline1,),
      ),
      body: Container(),
    );
  }
}
