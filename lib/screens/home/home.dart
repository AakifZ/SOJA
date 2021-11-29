import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soja/services/MyThemes.dart';
import 'package:soja/services/auth.dart';
import 'package:soja/services/changeTheme.dart';
import 'package:soja/screens/addpost/add_post.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';

    return Scaffold(
      body: Container(
          color: Colors.black38,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                  title: Text("POST", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
                    subtitle: Text("blah"),
                ),),
              ),
            ],
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
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddPost()));
      },
      child: Icon(Icons.edit, color: Colors.white,),
        backgroundColor: Colors.purple,
        tooltip: "Add a Post",
      ),
    );
  }
}