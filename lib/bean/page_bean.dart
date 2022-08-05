
import 'package:json_annotation/json_annotation.dart';

part 'page_bean.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PageBean<T>{

  @JsonKey(name: "curPage")
  int? curPage;

  @JsonKey(name: "pageCount")
  int? pageCount;

  @JsonKey(name: "size")
  int? size;

  @JsonKey(name: "total")
  int? total;

  @JsonKey(name: "datas")
  List<T>? datas;

  PageBean(
    this.curPage,
    this.pageCount,
    this.size,
    this.total,
    this.datas
  );

  factory PageBean.fromJson(Map<String, dynamic> json, T Function(Object? source) fromJsonT) => _$PageFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$PageToJson(this, toJsonT);
}