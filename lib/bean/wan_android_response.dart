
import 'package:json_annotation/json_annotation.dart';

part 'wan_android_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class WanAndroidResponse<T> {

  @JsonKey(name: "errorCode")
  int? errorCode;

  @JsonKey(name: "errorMsg")
  String? errorMsg;

  @JsonKey(name: "data")
  T data;

  WanAndroidResponse(
      this.errorCode,
      this.errorMsg,
      this.data
      );

  factory WanAndroidResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$WanAndroidResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$WanAndroidResponseToJson(this, toJsonT);
}