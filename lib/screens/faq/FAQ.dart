import 'package:flutter/material.dart';
import 'package:soja/settings/settings_page.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms & Conditions", style: TextStyle(fontSize: 22)),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SettingPageUI();
            }));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Text(
            'Q: What platform SOJA is available on? A: Platforms currently available are iOS and Android. Q: What type of games are we allowed to talk about? A: You can talk about any game you like! Q: How friendly is the community? A: We provide users the most friendly experience to everyone.'
        ),
      ),
    );
  }
}
