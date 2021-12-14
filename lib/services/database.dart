import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soja/models/post.dart';
import 'package:soja/models/post.dart';

class DatabaseService {

  final String uid;

  DatabaseService({ required this.uid });

  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection("users");

  final CollectionReference postCollection = FirebaseFirestore.instance
      .collection("posts");

  /**
   * This method takes in all of a user's information and inserts it into the 'users' collection in the Firestore database.
   */
  Future updateUserData(String email, String username, String firstName,
      String lastName, String DOB, String password, String gender) async {
    return await userCollection.doc(uid).set({
      'email': email,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'DOB': DOB,
      'password': password,
      'gender': gender,
      'sojaPoints': 0,
    });
  }

  Future updateBio(String uid, String bio) async {
    return await userCollection.doc(uid).update({
      'bio': bio
    });
  }

  Future getUsername(String uid) async {
    print("They are printed below");
    //print( userCollection.firestore.doc("username").id);
    //await userCollection.firestore.doc(uid).get().then((value) => print(value));
    userCollection.get().then((value) {
      if(value.docs.length > 0) {
        print("The value is: " + value.docs[0].data().toString());
      }
    });
  }
}