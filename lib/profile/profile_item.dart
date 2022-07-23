import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/config/AppColors.dart';

class ProfileItem extends StatelessWidget {

  final Widget icon;
  final String title;
  final VoidCallback onTap;

  const ProfileItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        tileColor: AppColors.lightBGPrimary,
        horizontalTitleGap: 0,
        leading: this.icon,
        title: Text(
          this.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        onTap: this.onTap,
      ),
    );
  }
}
