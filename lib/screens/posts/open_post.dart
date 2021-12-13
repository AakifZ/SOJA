
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:like_button/like_button.dart';
import 'package:soja/models/post.dart';
import 'package:soja/models/reply.dart';

class OpenPost extends StatefulWidget {
  final String title;
  final String content;
  final String game;
  final String documentID;
  //const OpenPost(title, content, game, likes, dislikes, {Key? key}) : super(key: key);
  const OpenPost(this.title, this.content, this.game, this.documentID);

  @override
  _OpenPostState createState() => _OpenPostState();
}



class _OpenPostState extends State<OpenPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text(widget.title),),
      body: SingleChildScrollView(
        child: Card(
          child: ListTile(
            title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25), ),
            subtitle: Text(widget.content, style: TextStyle(fontSize: 15),),
          ),
        ),
      )
      /*body: SingleChildScrollView(
        child:
          Container(
            margin: EdgeInsets.all(10),
            child: FutureBuilder(
            future: getPosts(widget.documentID),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
    //For reload on button click
    if (snapshot.connectionState == ConnectionState.done) {
    // If JSON data has not arrived yet show loading
    if (snapshot.data == null) {
    return Container(
    child: Center(
    child: Text("Loading... forever"),
    ),
    );
    } else {
    //Once the JSON Data has arrived build the list
    return ListView.builder(
    //LINE 76 makes cards scrollable
    physics: PageScrollPhysics(),
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: snapshot.data.length,
    itemBuilder: (BuildContext context, int index) {
    //List tile / Song row
    return Card(

    child: Column (
    children: <Widget>[
    ListTile(
    title: Text(snapshot.data[index].title, style: TextStyle(fontSize: 20)),
    subtitle: Text(snapshot.data[index].content, style: TextStyle(fontSize: 15, height: 2), ),
    trailing: Text(snapshot.data[index].game, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 18.0),),
    ),
    ButtonBar(),

    ]
    ),
    );
    }
    );}
    }
    throw(
      Container(
        child: Text("Problemo"),
      )
    );
    })))
    */);}}


getPosts(postID) async {
/*  List<Reply> _replies = [];

  var document = await FirebaseFirestore.instance.collection('posts').where(
    FieldPath.documentId,
    isEqualTo: postID
  ).get().then((value) {
    if(value.docs.isNotEmpty) {
      Reply reply = new Reply(value.docs.single.data(), comment);
      
    }
  });*/

  /*await FirebaseFirestore.instance.collection("posts".tr)
      .get(postID).then((querySnapshot) {
    querySnapshot.docs.forEach((result) {
      Reply reply = Reply(result.get("uid"), result.get("comment"));
      _replies.add(reply);
      print("This is the comment below!");
      print(reply.comment);
    });
  });*/
  //return _replies;
}