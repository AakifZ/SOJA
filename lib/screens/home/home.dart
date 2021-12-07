import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soja/models/post.dart';
import 'package:soja/screens/posts/new_post_page.dart';
import 'package:soja/services/MyThemes.dart';
import 'package:soja/services/auth.dart';
import 'package:soja/services/changeTheme.dart';
import 'package:soja/services/database.dart';
import 'package:soja/settings/settings_page.dart';
import 'package:get/get.dart';
import '../../main.dart';
import '../posts/post.dart';
import 'post_list.dart';
import 'package:soja/models/post.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  final List locale =[
    {'name':'ENGLISH','locale': Locale('en','US')},
    {'name':'Español','locale': Locale('es','SP')},
    {'name':'हिंदी','locale': Locale('hi','IN')},
  ];

  updateLanguage(Locale locale){
    Get.back();
    Get.updateLocale(locale);
  }

  builddialog(BuildContext context){
    showDialog(context: context,
        builder: (builder){
          return AlertDialog(
            title: Text('Choose Your Language'),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[index]['name']),
                        onTap: (){
                        print(locale[index]['name']);
                        updateLanguage(locale[index]['locale']);
                      },),
                    );
                  }, separatorBuilder: (context,index){
                return Divider(
                  color: Colors.blue,
                );
              }, itemCount: locale.length
              ),
            ),
          );
        }
    );
  }
  final Stream<QuerySnapshot> posts = FirebaseFirestore.instance.collection('posts').snapshots();

  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? 'DarkTheme'
    : 'LightTheme';


    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text('hello'.tr, style: TextStyle(fontSize: 32),),
              ElevatedButton(onPressed: (){
                  builddialog(context);
              }, child: Text('Language'.tr)),
              PostService().getPosts(),

            ]
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
                    return SettingPageUI();
                  }));
                },
                icon: Icon(Icons.settings),
                label: Text('Settings'.tr)),

            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'.tr),
              onPressed: () async{
                await _auth.signOut();
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NewPostPage()));
          },
          child: Icon(Icons.edit),
          backgroundColor: Colors.purple,
        ),
      );
  }
}
