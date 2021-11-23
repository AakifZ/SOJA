import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soja/services/MyThemes.dart';
import 'package:soja/services/auth.dart';
import 'package:soja/services/changeTheme.dart';

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
          ChangeTheme(),
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
