import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/api/wan_api.dart';
import 'package:flutter_wanandroid/profile/integral/model/ranking_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class IntegralRankingPage extends StatefulWidget {
  const IntegralRankingPage({Key? key}) : super(key: key);

  @override
  _IntegralRankingPageState createState() => _IntegralRankingPageState();
}

class _IntegralRankingPageState extends State<IntegralRankingPage> {

  List<RankingModel> rankingList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WanApi.getRanking(1).then((value) {
      setState(() {
        rankingList = value.datas ?? [];
      });
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: "网络出错了");
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("积分排行"),
      ),
      body: isLoading ? Center(
        child: CircularProgressIndicator(),
      ) : rankingList.isEmpty ? Center(
        child: Text("列表为空"),
      ) : ListView.separated(
          itemBuilder: (context, index) {
            final rank = rankingList[index];
            return ListTile(
              leading: Text(rank.rank ?? "",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              title: Text(rank.username ?? ""),
              trailing: Text(rank.coinCount?.toString() ?? ""),
            );
          }, separatorBuilder: (context, index) {
            return Divider(height: 0.0,);
      }, itemCount: rankingList.length),
    );
  }
}
