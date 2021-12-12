import 'package:flutter/material.dart';
import 'package:soja/screens/authenticate/rest.dart';
import 'package:soja/services/auth.dart';
import 'package:soja/shared/constants.dart';
import 'package:soja/shared/loading.dart';


class SignIn extends StatefulWidget {

  final Function? toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';
  String uid = "";

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        elevation: 0.0,
        title:Text('Sign in to SOJA'),
          actions: <Widget> [
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text('Register'),
              onPressed: () {
                widget.toggleView!();
              }
            )
          ],
      ), body: SingleChildScrollView(
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
          SizedBox(height: 20.0,),
          TextFormField(
          decoration: textInputDecoration.copyWith(hintText: 'Enter Password'),
              style: TextStyle(color: Colors.black),
          obscureText: true,
              validator: (val) => val!.length < 8 ? 'Enter a password 8+ chars long' : null,
            onChanged: (val) {
              setState(() {
                password = val;
              });
            }
          ),
          SizedBox(height: 20.0,),
          ElevatedButton(
            child: Text('Sign In'),
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(Colors.purple[400]),
                textStyle: MaterialStateProperty.all(
                    TextStyle(color: Colors.white))),
            onPressed: () async {
              if(_formKey.currentState!.validate()) {
                setState(() => loading = true);
                dynamic result = await _auth.signIn(email, password);
                 if (result == null) {
                   setState(() {
                    error = 'could not sign in with those credentials';
                    loading = false;
                 });
                }
              }
            },
          ),
          SizedBox(height: 12.0),
          Text(
            error,
            style: TextStyle(color: Colors.red, fontSize: 14.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(child: Text('Forgot Password'), onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Reset())) ,)
            ],
          ),
        ],
        ),
      ),
    ),
    );
  }
}
