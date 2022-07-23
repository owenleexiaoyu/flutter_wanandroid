class Nav {
  Nav({
      this.articles, 
      this.cid, 
      this.name,});

  Nav.fromJson(dynamic json) {
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(NavArticle.fromJson(v));
      });
    }
    cid = json['cid'];
    name = json['name'];
  }
  List<NavArticle>? articles;
  int? cid;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    map['cid'] = cid;
    map['name'] = name;
    return map;
  }

}

class NavArticle {
  NavArticle({
      this.link, 
      this.title,});

  NavArticle.fromJson(dynamic json) {
    link = json['link'];
    title = json['title'];
  }
  String? link;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['link'] = link;
    map['title'] = title;
    return map;
  }

}