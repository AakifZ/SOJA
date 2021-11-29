import 'package:firebase_database/firebase_database.dart';

class Post {
  static const KEY = "key";
  static const DATE = "date";
  static const TITLE = "title";
  static const CONTENT = "content";
  static const LIKES = "likes";
  static const DISLIKES = "dislikes";

  String title;
  String? key;
  int date;
  int likes;
  int dislikes;
  String content;

  Post(this.title, this.date, this.likes, this.dislikes, this.content);

  Post.fromSnapshot(DataSnapshot snap):
      this.key = snap.key,
      this.content = snap.value[CONTENT],
      this.date = snap.value[DATE],
      this.likes = snap.value[LIKES],
      this.dislikes = snap.value[DISLIKES],
      this.title = snap.value[TITLE];

  Map toMap() {
    return {CONTENT: content, TITLE: title, DATE: date, LIKES: likes, DISLIKES: dislikes};
  }

}