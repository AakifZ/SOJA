import 'package:flutter/material.dart';
import 'package:soja/screens/home/home.dart';
import 'package:soja/settings/settings_page.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("About Us", style: TextStyle(fontSize: 22)),
          leading: IconButton(
          onPressed: () {
          /*Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SettingPageUI();
          }));*/
            Navigator.pop(context);
          },
          icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          ),
          ),
        ),
      body: Center(
        child: Text(
          'Hello, welcome to SOJA, we are a gaming forum app that talks about games.'
              'This app is developed by Omer, Aakif, Shuaib, and Jonathan.',
            style: TextStyle(fontSize: 22)
        ),
      ),
    );
  }
}
