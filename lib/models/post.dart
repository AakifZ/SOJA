import 'package:firebase_database/firebase_database.dart';

class Post {
  static const TITLE = "title";
  static const CONTENT = "content";
  static const LIKES = "likes";
  static const DISLIKES = "dislikes";
  static const GAME = "game";

  String title;
  int likes;
  int dislikes;
  String content;
  String game;

  Post(this.title, this.content, this.likes, this.dislikes, this.game);

/*
  Post.fromSnapshot(DataSnapshot snap)
      :
        this.title = snap.value[TITLE],
        this.content = snap.value[CONTENT],
        this.likes = snap.value[LIKES],
        this.dislikes = snap.value[DISLIKES],
        this.game = snap.value[GAME],
*/

/*  Map toMap() {
    return {
      TITLE: title,
      CONTENT: content,
      LIKES: likes,
      DISLIKES: dislikes,
      GAME: game,
    };
  }*/
}