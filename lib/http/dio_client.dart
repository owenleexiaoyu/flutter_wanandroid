import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class DioClient {

  /// 超时时间常量
  static const int CONNECT_TIMEOUT = 15000;
  static const int RECEIVE_TIMEOUT = 15000;

  /// 提供 DioClient 单例
  static final DioClient _instance = DioClient._internal();

  factory DioClient() => _instance;

  late Dio dio;

  /// 真正的构造函数
  DioClient._internal() {
    BaseOptions options = BaseOptions(
      connectTimeout: CONNECT_TIMEOUT,
      receiveTimeout: RECEIVE_TIMEOUT,
      headers: {}
    );
    dio = Dio(options);
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
    //   client.findProxy = (uri) {
    //     // 代理链接可能会变
    //     return "PROXY 192.168.31.80:8888";
    //   };
    // };
  }


}