import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:soja/models/post.dart';
import 'package:soja/models/post.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<List<Post>?>(context) ?? [];
    posts.forEach((post) {
      print(post.title);
      print(post.content);
      // print(post.game);
    });
    return Container();
  }

}
