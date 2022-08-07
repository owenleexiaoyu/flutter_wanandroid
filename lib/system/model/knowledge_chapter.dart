class KnowledgeChapter {
  KnowledgeChapter({
      this.children, 
      this.id, 
      this.name, 
      this.order, 
      this.parentChapterId,});

  KnowledgeChapter.fromJson(dynamic json) {
    if (json['children'] != null) {
      children = [];
      json['children'].forEach((v) {
        children?.add(KnowledgeChapter.fromJson(v));
      });
    }
    id = json['id'];
    name = json['name'];
    order = json['order'];
    parentChapterId = json['parentChapterId'];
  }
  List<KnowledgeChapter>? children;
  int? id;
  String? name;
  int? order;
  int? parentChapterId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (children != null) {
      map['children'] = children?.map((v) => v.toJson()).toList();
    }
    map['id'] = id;
    map['name'] = name;
    map['order'] = order;
    map['parentChapterId'] = parentChapterId;
    return map;
  }

}