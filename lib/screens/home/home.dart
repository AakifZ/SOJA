import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soja/screens/about/about.dart';
import 'package:soja/screens/profile/profile.dart';
import 'package:soja/services/MyThemes.dart';
import 'package:soja/services/auth.dart';
import 'package:soja/services/changeTheme.dart';
import 'package:soja/settings/settings_page.dart';

import '../../main.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? 'DarkTheme'
    : 'LightTheme';

    return Scaffold(
      body: Center(
        child: Text(
          //Presents either "light mode" or "dark mode" in text body.
          'Hello $text!',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
     /* backgroundColor: Colors.purple[50],*/
      appBar: AppBar(
        title: Text('SOJA'),
        backgroundColor: Colors.purple[400],
        elevation: 0.0,
        actions: <Widget>[
          //Here is where the toggle switch functionality is, in the appbar
          TextButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return About();
                }));
              },
              icon: Icon(Icons.person),
              label: Text('About Us')),
         TextButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SettingPageUI();
                }));
              },
              icon: Icon(Icons.settings),
              label: Text('Settings')),

          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async{
              await _auth.signOut();
            },
          )
        ],
      ),
    );
  }
}
