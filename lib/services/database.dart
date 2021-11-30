import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ required this.uid });

  final CollectionReference userCollection =
    FirebaseFirestore.instance.collection("users");
  /**
   * This method takes in all of a user's information and inserts it into the 'users' collection in the Firestore database.
   */
  Future updateUserData(String email, String username, String firstName, String lastName, String DOB, String password, String gender) async {
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
}