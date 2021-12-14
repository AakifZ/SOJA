
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soja/bio/bio.dart';
import 'package:soja/screens/home/home.dart';
import 'package:soja/screens/posts/post.dart';
import 'package:soja/screens/profile/profile.dart';
import 'package:soja/services/database.dart';
import 'package:soja/shared/constants.dart';

class BioPage extends StatefulWidget {
  const BioPage({Key? key}) : super(key: key);

  @override
  _BioPageState createState() => _BioPageState();
}

class _BioPageState extends State<BioPage> {
  var currentUser = FirebaseAuth.instance.currentUser;
  DatabaseService dataService = new DatabaseService(uid: '');
  String bio = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Update Bio'),),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance.collection('users').doc(currentUser!.uid).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return new Text("Loading");
              }
            return Column(
                children: <Widget> [
                  Text('Bio', style: TextStyle(fontSize: 20),),
                  TextFormField(
                    initialValue: snapshot.data!['bio'],
                    decoration: textInputDecoration.copyWith(hintText: 'Bio'),
                    style: TextStyle(color: Colors.black),
                    maxLines: 3,
                    onChanged: (val) {
                      bio = val;
                    },
                  ),

                  FlatButton(

                    onPressed: ()=> {
                      if(bio.isEmpty) {
                        error = "Please fill in all fields!"
                      } else
                        {
                          dataService.updateBio(currentUser!.uid, bio)
                              .then((value) => {
                            print("Posted Successfully"),
                            Navigator.pop(context)
                          })

                              .catchError((error) => {
                            setState(() {
                              this.error = 'Could not post!';
                            }),
                          }),
                        },                }, child: Text('Update Bio',
                    style: TextStyle(color: Colors.purple, fontSize: 20,),),
                  ),
                ]
            );
          }
        ),
      ),
    );
  }
}