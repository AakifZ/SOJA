import 'package:flutter/material.dart';
import 'package:soja/db/PostService.dart';
import 'package:soja/models/post.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final GlobalKey<FormState>? formKey = new GlobalKey();
  Post? post = Post("", 0, 0, 0, "");
  PostService? postService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Post"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Post Title",
                  border: OutlineInputBorder()
              ),
              onSaved: (val) => post!.title = val!,
              validator: (val) {
                return "Title Field Cannot Be Empty";
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Post Body",
                  border: OutlineInputBorder()
              ),
              onSaved: (val) => post!.content = val!,
              validator: (val) {
                return "Body Field Cannot Be Empty";
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        insertPost();
      },
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.purple,
        tooltip: "Add a Post",
      ),
    );
  }

  void insertPost() {
    final FormState? form = formKey!.currentState;
    if(form!.validate()) {
      form.save();
      form.reset();
      post!.date = DateTime.now().millisecondsSinceEpoch;
      PostService postService = PostService(post!.toMap());
      postService!.addPost();
    }
  }
}

