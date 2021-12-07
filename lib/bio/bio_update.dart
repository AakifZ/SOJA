
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soja/bio/bio.dart';
import 'package:soja/screens/home/home.dart';
import 'package:soja/screens/posts/post.dart';
import 'package:soja/screens/profile/profile.dart';
import 'package:soja/shared/constants.dart';

class BioPage extends StatelessWidget {

  BioService bioService = new BioService();
  String bio = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Bio'),),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
            children: <Widget> [
              Text('Bio', style: TextStyle(fontSize: 20),),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Bio'),
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
                      bioService.updatePostData(bio),
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile())),
                    },
                }, child: Text('Update Bio',
                style: TextStyle(color: Colors.purple, fontSize: 20,),),
              ),
            ]
        ),
      ),
    );
  }
}