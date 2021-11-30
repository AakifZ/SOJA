

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:soja/services/auth.dart';
import 'package:soja/services/database.dart';

final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");


void main() {
  test('All user information should be added', () {
    AuthService auth = new AuthService();
    auth.register("bobby@gmail.com", "bobbyboy123", "Bobby", "Boy", "01/01/0001", "iambobby", "male");

  });
  test("Test if 'users' collection exists.", () async {

    final snapshot = await FirebaseFirestore.instance.collection("users").doc();
    expect(snapshot== 0, false);

  });
}

