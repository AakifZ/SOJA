// <<<<<<< screens
// import 'package:firebase_database/firebase_database.dart';

// class Post {
//   static const KEY = "key";
//   static const DATE = "date";
//   static const TITLE = "title";
//   static const CONTENT = "content";
//   static const LIKES = "likes";
//   static const DISLIKES = "dislikes";

//   String title;
//   String? key;
//   int date;
//   int likes;
//   int dislikes;
//   String content;

//   Post(this.title, this.date, this.likes, this.dislikes, this.content);

//   Post.fromSnapshot(DataSnapshot snap):
//       this.key = snap.key,
//       this.content = snap.value[CONTENT],
//       this.date = snap.value[DATE],
//       this.likes = snap.value[LIKES],
//       this.dislikes = snap.value[DISLIKES],
//       this.title = snap.value[TITLE];

//   Map toMap() {
//     return {CONTENT: content, TITLE: title, DATE: date, LIKES: likes, DISLIKES: dislikes};
//   }
// =======
// class Post {
//   final String title;
//   final String content;
//   final String game;
//   final int likes;
//   final int dislikes;
//   final String user;

//   Post({required this.title, required this.content, required this.game, required this.likes, required this.dislikes, required this.user});
// >>>>>>> main

// }