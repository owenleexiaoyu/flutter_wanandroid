class NameLinkBean {
  NameLinkBean({
      this.link, 
      this.name,});

  NameLinkBean fromJson(dynamic json) {
    link = json['link'];
    name = json['name'];
    return this;
  }

  String? link;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['link'] = link;
    map['name'] = name;
    return map;
  }

}