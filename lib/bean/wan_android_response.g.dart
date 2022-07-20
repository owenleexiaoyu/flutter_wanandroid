// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wan_android_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WanAndroidResponse<T> _$WanAndroidResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    WanAndroidResponse<T>(
      json['errorCode'] as int?,
      json['errorMsg'] as String?,
      fromJsonT(json['data']),
    );

Map<String, dynamic> _$WanAndroidResponseToJson<T>(
  WanAndroidResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': toJsonT(instance.data),
    };
