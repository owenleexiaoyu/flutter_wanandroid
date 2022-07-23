class ThirdPartyLibs {
  static List<ThirdPartyLib> getThirdPartyLibs() {
    return [
      ThirdPartyLib("dio", "https://github.com/flutterchina/dio"),
      ThirdPartyLib("json_serializable", "https://github.com/google/json_serializable.dart"),
      ThirdPartyLib("nil", "https://github.com/letsar/nil"),
      ThirdPartyLib("fluttertoast", "https://github.com/ponnamkarthik/FlutterToast"),
      ThirdPartyLib("webview_flutter", "https://github.com/fluttercommunity/flutter_webview_plugin"),
      ThirdPartyLib("flutter_svg", "https://github.com/dnfield/flutter_svg"),
    ];
  }
}

class ThirdPartyLib {
  String title;
  String link;
  
  ThirdPartyLib(this.title, this.link);
}