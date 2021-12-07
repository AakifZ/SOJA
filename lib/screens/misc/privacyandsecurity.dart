import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class securityandprivacy extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Privacy & Security'),),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),

        child: Column(

            children: <Widget> [
              Text("Privacy: We take our privacy very seriously like Apple, no data or information will be spread to third-party apps or websites. If there are any concerns please let the developers know", style: TextStyle(fontSize: 20),),
              Text(" "),
              Text("Security: We are prideful or our privacy policy, so we ensure our users that there info and posts will be safe and secured", style: TextStyle(fontSize: 20),),

            ]
        ),
      ),
    );
  }
}