import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TermsandConditions extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Terms and Conditions'),),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),

        child: Column(


            children: <Widget> [
              Text("1. Behavior", style: TextStyle(fontSize: 20),),
              Text("  1.1- Treat others users of how they want to be treated", style: TextStyle(fontSize: 15)),
              Text("  1.2- Do not put personal information to the forums.", style: TextStyle(fontSize: 15),),
              Text("  1.3- No harassment of other members. Racism, sexism, xenophobia, transphobia, homophobia, misogyny etc. have a perfect zero-tolerance", style: TextStyle(fontSize: 15),),
              Text("  1.4- Respect others' personal space.", style: TextStyle(fontSize: 15),),
              Text("  1.5- Use common sense and don’t be toxic.", style: TextStyle(fontSize: 15),),

              Text("2. Content", style: TextStyle(fontSize: 20),),
              Text("  2.1- NSFW, Slurs, and threats is not allowed", style: TextStyle(fontSize: 15),),
              Text("  2.2- No spamming!", style: TextStyle(fontSize: 15),),
              Text("  2.3- Use common sense and don’t be toxic.", style: TextStyle(fontSize: 15),),
              Text("  2.4- Use the appropriate channel for your discussions. If you are posting a Halo meme, keep it in the Halo Sub Forum", style: TextStyle(fontSize: 15),),
              Text("  2.5- No Spoilers! We don't know who has not played or watched what so we don't want to spoil it for any user", style: TextStyle(fontSize: 15),),
              Text("  2.6- Self Promo is not allowed as it will create a lot of junk and not much conversation", style: TextStyle(fontSize: 15),),

              Text("Failing to abide to these rules then it'll be a gg. Other than that, have fun!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)



            ]
        ),
      ),
    );
  }
}