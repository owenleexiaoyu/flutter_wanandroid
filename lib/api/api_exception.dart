class ApiException implements Exception {
  final int code;
  final String? msg;

  ApiException({required this.code, this.msg});

  @override
  String toString() {
    return "[code = $code, msg = ${msg ?? "network error"}]";
  }

}