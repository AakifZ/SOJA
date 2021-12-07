import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:soja/models/post.dart';
import 'package:soja/models/post.dart';
import 'package:soja/screens/posts/post.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    PostService postService = new PostService();
    //List<Post> posts = postService.getPosts();
    return Container(
      child: getList(),
    );
  }

  Widget getList() {
    //List<Post> posts = PostService().getPosts();
    ListView postList = ListView.builder(
        //itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            //title: Text(posts[index].title,),
          );
        });
    return postList;

  }
}
