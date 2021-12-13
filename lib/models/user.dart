import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser{

  final String? uid;

  MyUser({ this.uid });

}

class UserData {
  final String? title;
  final int? likes;
  final int? dislikes;
  final String? content;
  final String? game;
  final String? uid;

  UserData({this.content, this.dislikes, this.game, this.likes, this.title, this.uid});

}