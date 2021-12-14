import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';


class FAQpage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FAQ'.tr),),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),

        child: Column(

              children: <Widget> [
                Text("Q: What platform SOJA is available on?".tr, style: TextStyle(fontSize: 20),),
                Text("A: Platforms currently available are iOS and Android.".tr, style: TextStyle(fontSize: 20),),
                Text("Q: What type of games are we allowed to talk about?".tr, style: TextStyle(fontSize: 20),),
                Text("A: You can talk about any game you like!".tr, style: TextStyle(fontSize: 20),),
                Text("Q: How friendly is the community? We provide users the most friendly experience to everyone.".tr, style: TextStyle(fontSize: 20),)
          ]
        ),
      ),
    );
  }
}