import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:soja/models/post.dart';
import 'package:soja/screens/authenticate/sign_in.dart';
import 'package:soja/screens/posts/new_post_page.dart';
import 'package:soja/screens/posts/open_post.dart';
import 'package:soja/screens/posts/update_post.dart';
import 'package:soja/services/MyThemes.dart';
import 'package:soja/services/auth.dart';
import 'package:soja/services/changeTheme.dart';
import 'package:soja/services/database.dart';
import 'package:soja/settings/settings_page.dart';
import 'package:get/get.dart';
import '../../main.dart';
import '../posts/post.dart';
import 'post_list.dart';
import 'package:soja/models/post.dart';
import 'package:share/share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:like_button/like_button.dart';


class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  String uid = "";

@override
  void initState() {
    getPosts();
    //_auth.checkLogin();
    // print("Testing hereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
    // print("The current uid is: " + _auth.currentUID);
    var currentUser = FirebaseAuth.instance.currentUser;
    print(currentUser!.uid);
    uid = currentUser.uid;
    DatabaseService databaseService = new DatabaseService(uid: uid);
    databaseService.getUsername(uid);
}
  final AuthService _auth = AuthService();
  final PostService postService = new PostService();

  // final Stream<QuerySnapshot> posts = FirebaseFirestore.instance.collection('posts').snapshots();

  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? 'DarkTheme'
    : 'LightTheme';

    return Scaffold(
      
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0), child: Text("SOJA", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),)),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0), child: Image(image: AssetImage('assets/sojalinked.png'), height: 50,),),
              Container(
                  margin: EdgeInsets.all(10),
                  child: FutureBuilder(
                      future: getPosts(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        //For reload on button click
                        if (snapshot.connectionState == ConnectionState.done) {
                          // If JSON data has not arrived yet show loading
                          if (snapshot.data == null) {
                            return Container(
                              child: Center(
                                child: Text("Loading... forever".tr),
                              ),
                            );
                          } else {
                            //Once the JSON Data has arrived build the list
                            return ListView.builder(
                              //LINE 76 makes cards scrollable
                              physics: PageScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  //List tile / Song row
                                  return Card(

                                    child: Column (
                                      children: <Widget>[
                                        Card(
                                          //child: Text(snapshot.data[index].uid),

                                        ),
                                        ListTile(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => OpenPost(snapshot.data[index].title, snapshot.data[index].content, snapshot.data[index].game, snapshot.data[index].documentID)));
                                          },
                                          title: Text(snapshot.data[index].title, style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                                          subtitle: Text(snapshot.data[index].content, style: TextStyle(fontSize: 20, height: 1), ),
                                          trailing: Text(snapshot.data[index].game, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 18.0),),
                                        ),
                                       /* Container(
                                          height: 40,
                                        ),
                                        Container(
                                          color: Colors.white,
                                          //child: (uid == snapshot.data[index].uid) ? Icon(Icons.edit) : const Text("HIYA"),
                                        ),*/
                                        ButtonBar(
                                          children: [
                                            (uid == snapshot.data[index].uid) ?
                                            TextButton(onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (_) => UpdatePost(documentId: snapshot.data[index].documentID)));
                                            }, child: Icon(Icons.edit),) : const Text(""),
                                            (uid == snapshot.data[index].uid) ?
                                            TextButton(onPressed: () {
                                              //DELETE POST
                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return AlertDialog(
                                                        title: Text("Are you sure you want to delete this post?".tr),
                                                        actions: [
                                                          FlatButton(onPressed: () {
                                                            Navigator.pop(context);
                                                          }, child: Text("Cancel".tr)),
                                                          FlatButton(onPressed: (){
                                                            postService.deleteData(snapshot.data[index].documentID).then((value) => setState(() {}));
                                                            Fluttertoast.showToast(
                                                                msg: "Post Successfully Deleted!".tr,
                                                                toastLength: Toast.LENGTH_SHORT,
                                                                gravity: ToastGravity.CENTER,
                                                                timeInSecForIosWeb: 1,
                                                                backgroundColor: Colors.purple,
                                                                textColor: Colors.white,
                                                                fontSize: 16.0
                                                            );
                                                            Navigator.pop(context);
                                                          }, child: Text("Delete".tr, style: TextStyle(color: Colors.red),))
                                                        ]
                                                    );
                                                  });

                                              print("The id is: " + snapshot.data[index].documentID);


                                            }, child: Icon(Icons.delete)) : const Text(""),
                                            LikeButton(
                                              likeBuilder: (bool isLiked) {
                                                return Icon(
                                                  Icons.thumb_up,
                                                  color: isLiked ? Colors.deepPurpleAccent[100]: Colors.grey,

                                                );
                                              },

                                              likeCount: snapshot.data[index].likes,
                                              countBuilder: (int? count, bool isLiked, String text) {
                                                var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                                                Widget result;
                                                if (count == 0) {
                                                  result = Text(
                                                    "0",
                                                    style: TextStyle(color: color),
                                                  );
                                                } else
                                                  result = Text(
                                                    text,
                                                    style: TextStyle(color: color),
                                                  );
                                                return result;
                                              },

                                            ),

                                            // TextButton(onPressed: () {
                                            //   //Like
                                            // }, child: Icon(Icons.thumb_up)),
                                            // TextButton(onPressed: (){
                                            //   //Dislike
                                            // }, child: Icon(Icons.thumb_down),),
                                            TextButton(onPressed: () {
                                              //SHARE

                                              share(context, snapshot.data[index]);
                                            }, child: Icon(Icons.share)),


                                          ],
                                        ),
                                        // IconButton( icon: Icon(Icons.edit),
                                        // onPressed: () {
                                        //   Navigator.push(context, MaterialPageRoute(builder: (_) => NewPostPage()));
                                        // } ),
                                        // Text(snapshot.data[index].title,),
                                        // Text(snapshot.data[index].content),
                                        // Text(snapshot.data[index].game),
                                      ],

                                    /*color: Colors.white,
                                    title: Text(snapshot.data[index].title,
                                        style: TextStyle(
                                            fontFamily: "Trajan Pro",
                                            height: 1.0,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF303030))),
                                    subtitle: Text(snapshot.data[index].content,
                                        style: TextStyle(
                                            fontFamily: "Trajan Pro",
                                            height: 1.0,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF303030))),
                                    trailing: Text(snapshot.data[index].game),
                                    onTap: () {
                                    },*/
                                    ),

                                  );
                                });
                          }
                        } else {
                          return Container(
                            child: Center(
                              child: Text("Loading...".tr),
                            ),
                          );
                        }
                      })),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20), child: Text("You've reached the end!".tr),),
            ]
          ),

        ),
       /* backgroundColor: Colors.purple[50],*/
        appBar: AppBar(
          title: Text('SOJA'),
          backgroundColor: Colors.purple[400],
          elevation: 0.0,
          actions: <Widget>[
            //Here is where the toggle switch functionality is, in the appbar

           TextButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SettingPageUI();
                  }));
                },
                icon: Icon(Icons.settings),
                label: Text('Settings'.tr)),

            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'.tr),
              onPressed: () async{
                await _auth.signOut();
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push( context, MaterialPageRoute( builder: (context) => NewPostPage()), ).then((value) => setState(() {}));

          },
          child: Icon(Icons.edit),
          backgroundColor: Colors.purple,
        ),
      );
  }

  getPosts() async {
    List<Post> _posts = [];
    await FirebaseFirestore.instance.collection("posts".tr)
        .get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        Post post = Post(result.get("documentID"), result.get('title'.tr), result.get('content'.tr), result.get('likes'.tr), result.get('dislikes'.tr), result.get('game'.tr), result.get("uid".tr));
        _posts.add(post);
        print(post.content);
      });
    });
    return _posts;
  }

  void share(BuildContext context, Post post) {
    //final RenderBox? box = context.findRenderObject();
    final String text = "${post.title} - ${post.content}";

    Share.share(text,
    subject: post.title);
    //sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,);
  }
}
