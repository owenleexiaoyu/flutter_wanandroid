import 'dart:ui';

class SvgIcons {
  /// 这个类不进行实例化
  SvgIcons._();

  static SvgIconData github = SvgIconData("assets/icons/github.svg");

}

class SvgIconData {

  String path;

  SvgIconData(this.path);

}