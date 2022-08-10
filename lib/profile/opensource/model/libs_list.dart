class ThirdPartyLibs {
  static List<ThirdPartyLib> getThirdPartyLibs() {
    return [
      ThirdPartyLib("dio", "https://github.com/flutterchina/dio"),
      ThirdPartyLib("json_serializable", "https://github.com/google/json_serializable.dart"),
      ThirdPartyLib("nil", "https://github.com/letsar/nil"),
      ThirdPartyLib("fluttertoast", "https://github.com/ponnamkarthik/FlutterToast"),
      ThirdPartyLib("webview_flutter", "https://github.com/fluttercommunity/flutter_webview_plugin"),
      ThirdPartyLib("flutter_svg", "https://github.com/dnfield/flutter_svg"),
      ThirdPartyLib("share_plus", "https://github.com/fluttercommunity/plus_plugins/tree/main/packages/share_plus"),
      ThirdPartyLib("url_launcher", "https://github.com/flutter/plugins/tree/main/packages/url_launcher/url_launcher"),
      ThirdPartyLib("getx", "https://github.com/jonataslaw/getx"),
      ThirdPartyLib("shared_preferences", "https://github.com/flutter/plugins/tree/main/packages/shared_preferences"),
      ThirdPartyLib("simple_html_css", "https://github.com/ali-thowfeek/simple_html_css_flutter"),
    ];
  }
}

class ThirdPartyLib {
  String title;
  String link;
  
  ThirdPartyLib(this.title, this.link);
}