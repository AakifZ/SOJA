import 'package:cloud_firestore/cloud_firestore.dart';
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

   getPosts() {
    //List<Post> posts = new List.empty();
     Map<String, dynamic> posts = new Map();
    FirebaseFirestore.instance.collection("posts").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        //posts.add(result.data());
        //posts.
        print(result.data());
      });
    });

  }


}