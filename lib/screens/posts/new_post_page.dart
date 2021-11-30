
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soja/screens/posts/post.dart';
import 'package:soja/shared/constants.dart';

class NewPostPage extends StatelessWidget {

  PostService postService = new PostService();
  String title = "";
  String content = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create a Post'),),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          children: <Widget> [
            Text("Title", style: TextStyle(fontSize: 20),),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Title'),
            onChanged: (val) {
                title = val;
            },
        ),
          Text('Content', style: TextStyle(fontSize: 20),),
          TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Content'),
            maxLines: 3,
            onChanged: (val) {
                content = val;
            },
          ),
          FlatButton(
            onPressed: ()=> postService.updatePostData(title, content), child: Text('Post',
            style: TextStyle(color: Colors.purple, fontSize: 20,),),
          )
      ]
      ),
      ),
    );
  }
}