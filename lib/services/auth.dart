import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  // sign in anon
  Future signInAnon() async {
    try {

      UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
      User? user = userCredential.user;
      return user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  // sign in email & password

  // register

  // sign out
}