import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:soja/models/post.dart';


class PostService {
  
  final CollectionReference postCollection = FirebaseFirestore.instance.collection("posts");

  Future updatePostData(String title, String content, String game) async {
    return await postCollection.doc(title).set({
      'title': title,
      'content': content,
      'game': game,
      'likes': 0,
      'dislikes': 0
    });
  }

/*  getPosts() {
    List<Post> posts = [];
    //List<Post> postage = postCollection.get().asStream().toList() as List<Post>;

    //Map<String, dynamic> posts = new Map();
    FirebaseFirestore.instance.collection("posts").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        Post post = Post(result.get('title'), result.get('content'), result.get('likes'), result.get('dislikes'), result.get('game'));
        posts.add(post);
        print(result.data());
        print("TITLE: " + result.get('title'));
        print(post.content);
      });
    });
    return posts;
    //return postage;
  }*/
}