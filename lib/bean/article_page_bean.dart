
import 'package:json_annotation/json_annotation.dart';

part 'article_page_bean.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ArticlePage<T>{

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

  ArticlePage(
    this.curPage,
    this.pageCount,
    this.size,
    this.total,
    this.datas
  );

  factory ArticlePage.fromJson(Map<String, dynamic> json, T Function(Object? source) fromJsonT) => _$ArticlePageFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$ArticlePageToJson(this, toJsonT);
}