import 'package:firebase_auth/firebase_auth.dart';
import 'package:soja/models/user.dart';
import 'package:soja/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String currentUID = "";


  // create user obj based on firebaseuser
  MyUser? _userFromFirebaseUser(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<MyUser?> get user {
    return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user!));
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User? user = userCredential.user;
      return _userFromFirebaseUser(user!);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  // sign in email & password
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      currentUID = user!.uid;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // register
  Future register(String email, String username, String firstName, String lastName, String date, String password, String gender) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      //Pass user registration data into the Firestore database and give user an initial soja point value of 0.
      await DatabaseService(uid: user!.uid).updateUserData(email, username, firstName, lastName, date, password, gender);
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

}