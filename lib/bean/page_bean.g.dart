// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageBean<T> _$PageFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PageBean<T>(
      json['curPage'] as int?,
      json['pageCount'] as int?,
      json['size'] as int?,
      json['total'] as int?,
      (json['datas'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$PageToJson<T>(
  PageBean<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
      'datas': instance.datas?.map(toJsonT).toList(),
    };
