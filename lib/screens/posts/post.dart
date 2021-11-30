import 'package:cloud_firestore/cloud_firestore.dart';


class PostService {
  
  final CollectionReference postCollection = FirebaseFirestore.instance.collection("posts");

  Future updatePostData(String title, String content,) async {
    return await postCollection.doc(title).set({
      'title': title,
      'content': content,
      'likes': 0,
      'dislikes': 0
    });
  }


}