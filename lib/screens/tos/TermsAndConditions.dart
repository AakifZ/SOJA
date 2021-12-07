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
            '1. Behavior 1.1- Treat others users of how they want to be treated. 1.2- Do not put personal information to the forums. 2. Content.2.1- NSFW, slurs, and threats is not allowed.'
        ),
      ),
    );
  }
}
