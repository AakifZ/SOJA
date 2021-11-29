import 'package:firebase_database/firebase_database.dart';
import 'package:soja/models/post.dart';


class PostService {
  String nodeName = "posts";
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference? _databaseReference;
  Map post;

  PostService(this.post);
  
  addPost() {
    // gives reference to the post node
    _databaseReference = database.reference().child(nodeName);
    _databaseReference!.push().set(post);
  }
}