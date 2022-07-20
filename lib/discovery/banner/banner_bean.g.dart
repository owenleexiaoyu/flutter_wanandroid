// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerBean _$BannerBeanFromJson(Map<String, dynamic> json) => BannerBean(
      json['title'] as String?,
      json['id'] as int?,
      json['imagePath'] as String?,
      json['url'] as String?,
    );

Map<String, dynamic> _$BannerBeanToJson(BannerBean instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'imagePath': instance.imagePath,
      'url': instance.url,
    };
