import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_wanandroid/config/SvgIcons.dart';

class SvgIcon extends StatelessWidget {

  final SvgIconData svgIconData;
  final double size;

  const SvgIcon({
    Key? key,
    required this.svgIconData,
    this.size = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(svgIconData.path,
      height: size,
      width: size,
    );
  }
}
