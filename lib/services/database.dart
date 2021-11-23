import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ required this.uid });

  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");

  Future updateUserData(String email, String username, String firstName, String lastName, String DOB, String password, String gender) async {
    return await userCollection.doc(uid).set({
      'email': email,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'DOB': DOB,
      'password': password,
      'gender': gender
    });
  }
}