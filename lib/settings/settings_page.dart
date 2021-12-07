import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soja/screens/about/about.dart';
import 'package:soja/screens/authenticate/rest.dart';
import 'package:soja/screens/authenticate/sign_in.dart';
import 'package:soja/screens/home/home.dart';
import 'package:soja/screens/misc/FAQ.dart';
import 'package:soja/screens/misc/Languages.dart';
import 'package:soja/screens/misc/TermsandConditions.dart';
import 'package:soja/screens/misc/privacyandsecurity.dart';
import 'package:soja/screens/profile/profile.dart';
import 'package:soja/screens/wrapper.dart';
import 'package:soja/services/auth.dart';
import 'package:soja/services/changeTheme.dart';


class SettingPageUI extends StatefulWidget {
  @override
  _SettingPageUIState createState() => _SettingPageUIState();
}

class _SettingPageUIState extends State<SettingPageUI> {

  final AuthService _auth = AuthService();

  bool val1 = true;
  bool val2 = true;
  bool val3 = true;

  onChangeFunction1(bool newVal1) {
    setState(() {
      val1 = newVal1;

    });
  }
  onChangeFunction2(bool newVal2) {
    setState(() {
      val2 = newVal2;
    });
  }
  onChangeFunction3(bool newVal3) {
    setState(() {
      val3 = newVal3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(fontSize: 22)),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Home();
            }));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,

          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.deepPurpleAccent,
                ),
                SizedBox(width: 10),
                Text("Account", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
              ],
            ),

            //Buttons
            Divider(height: 20, thickness: 1),
            SizedBox(height: 10),

            FlatButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Reset()));

            }, child:  Text("Change Password", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],

            ))),
           /* buildAccountOption(context, "Content Settings"),
            buildAccountOption(context, "Social"),
            LanguageWindow(context, "Languages"),*/


            FlatButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LanguagesPage()));

            }, child:  Text("Languages", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],

            ))),
            FlatButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => securityandprivacy()));

            }, child:  Text("Privacy and Security", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],

            ))),

            FlatButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FAQpage()));

            }, child:  Text("FAQ", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],

            ))),

            FlatButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TermsandConditionsPage()));

            }, child:  Text("Terms and Conditions", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],

            ))),

            FlatButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => About()));

            }, child:  Text("About", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],

            ))),

            FlatButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));

            }, child:  Text("Profile", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],

            ))),

            SizedBox(height: 40),
            Row(
              children: [
                Icon(Icons.volume_up_outlined, color: Colors.deepPurpleAccent),
                SizedBox(width: 10),
                Text("General", style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold))
              ],
            ),
            Divider(height: 20, thickness: 1),
            SizedBox(height: 10),
            buildNotificationOption("Dark Mode", val1, onChangeFunction1),

            SizedBox(height: 50),
            Center(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));

                  },
                  child: Text("Sign Out", style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 2.2
                  )),
                )
            )
          ],
        ),
      ),
    );
  }

  Padding buildNotificationOption(String title, bool value, Function onChangeMethod) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600]
            )),
            ChangeTheme()

    /*        Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  activeColor: Colors.blue,
                  trackColor: Colors.grey,
                  value: value,
                  onChanged: (bool newValue) {
                    onChangeMethod(newValue);
                  },
                ))*/
          ],
        )
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
      return GestureDetector(
          onTap: () {
            showDialog(context: context, builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2")
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close"))
                ],
              );
            });
          },
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600]
                    )),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey)
                  ]
              )
          )

      );

  }
  GestureDetector LanguageWindow(BuildContext context, String title) {
    return GestureDetector(
        onTap: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("English"),
                  Text("Spanish"),
                  Text("French")
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Close"))
              ],
            );
          });
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]
                  )),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey)
                ]
            )
        )
    );

  }
}