class RankingModel {
  RankingModel({
      this.coinCount, 
      this.level, 
      this.nickname, 
      this.rank, 
      this.userId, 
      this.username,});

  RankingModel fromJson(dynamic json) {
    coinCount = json['coinCount'];
    level = json['level'];
    nickname = json['nickname'];
    rank = json['rank'];
    userId = json['userId'];
    username = json['username'];
    return this;
  }

  int? coinCount;
  int? level;
  String? nickname;
  String? rank;
  int? userId;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['coinCount'] = coinCount;
    map['level'] = level;
    map['nickname'] = nickname;
    map['rank'] = rank;
    map['userId'] = userId;
    map['username'] = username;
    return map;
  }

}