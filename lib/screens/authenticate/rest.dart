import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:soja/services/auth.dart';
import 'package:soja/shared/constants.dart';
import 'package:soja/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Reset extends StatefulWidget {

  final Function? toggleView;
  Reset({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<Reset> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  final auth = FirebaseAuth.instance;

  String error = '';

  @override
  Widget build(BuildContext context) {
    /*if Loading is false then it will show the Scaffold method
    but if loading is true the loading function will run
     */
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        elevation: 0.0,
        title:Text('Send Request'),

      ), body: Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget> [
            SizedBox(height: 20.0,),
            TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Enter Email'),
                style: TextStyle(color: Colors.black),
                validator: (val) => val!.isEmpty ? 'Enter email' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    child: Text('Send Request'.tr),
                onPressed: () {
                  auth.sendPasswordResetEmail(email: email).then((value) {
                    Get.snackbar("Password reset email sent", "Success" );
                  }).catchError((onError)=> Get.snackbar("Error in Email", onError.message ));

                },
                ),
              ],
            ),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            ),
          ],
        ),
      ),
    ),
    );
  }
}