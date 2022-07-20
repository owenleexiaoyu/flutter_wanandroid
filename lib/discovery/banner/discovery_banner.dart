import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/api/wan_api.dart';
import 'package:flutter_wanandroid/http/dio_client.dart';
import 'package:flutter_wanandroid/api/wan_android_api_constants.dart';
import 'package:flutter_wanandroid/bean/wan_android_response.dart';
import 'package:flutter_wanandroid/discovery/banner/banner_bean.dart';


class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      alignment: Alignment.center,
      child: FutureBuilder<List<BannerBean>>(
        future: WanApi.getBanners(),
        builder: (context, AsyncSnapshot<List<BannerBean>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            List<BannerBean>? bannerDataList = snapshot.data;
            if (bannerDataList == null || bannerDataList.length == 0) {
              return Text("response is null");
            }
            return PageView.builder(
              itemCount: bannerDataList.length,
              itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.network(
                    bannerDataList[index].imagePath ?? "",
                  ),
                  Container(
                    height: 30,
                      width: double.infinity,
                      color: Colors.grey.withOpacity(0.5),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(bannerDataList[index].title ?? ""))
                ],
              );
            });
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
