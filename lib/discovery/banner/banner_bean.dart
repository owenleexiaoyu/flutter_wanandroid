
import 'package:json_annotation/json_annotation.dart';

part 'banner_bean.g.dart';

@JsonSerializable()
class BannerBean {
  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "imagePath")
  String? imagePath;

  @JsonKey(name: "url")
  String? url;

  BannerBean(this.title, this.id, this.imagePath, this.url);

  factory BannerBean.fromJson(Map<String, dynamic> json) => _$BannerBeanFromJson(json);

  Map<String, dynamic> toJson() => _$BannerBeanToJson(this);
}