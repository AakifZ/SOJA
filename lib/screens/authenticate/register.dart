import 'package:flutter/material.dart';
import 'package:soja/services/auth.dart';

class Register extends StatefulWidget {
  final Function? toggleView;
  Register({this.toggleView});


  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  // text field state
  String email = '';
  String firstName = '';
  String lastName = '';
  String date = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
          backgroundColor: Colors.purple[400],
          elevation: 0.0,
          title:Text('Register to SOJA'),
        actions: <Widget> [
          TextButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign In'),
              onPressed: () {
                widget.toggleView!();
              }
          )
        ],
      ),
      body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget> [
            SizedBox(height: 20.0,),
            TextFormField(
              validator: (val) => val!.isEmpty ? 'Enter email' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                }
            ),
            SizedBox(height: 20.0,),
            TextFormField(
                validator: (val) => val!.isEmpty ? 'Enter first name' : null,
                onChanged: (val) {
                  setState(() {
                    firstName = val;
                  });
                }
            ),
            SizedBox(height: 20.0,),
            TextFormField(
                validator: (val) => val!.isEmpty ? 'Enter last name' : null,
                onChanged: (val) {
                  setState(() {
                    lastName = val;
                  });
                }
            ),
            SizedBox(height: 20.0,),
            TextFormField(
                validator: (val) => val!.isEmpty ? 'Enter date of birth' : null,
                onChanged: (val) {
                  setState(() {
                    date = val;
                  });
                }
            ),
            SizedBox(height: 20.0,),
            TextFormField(
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
              child: Text('Register'),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.purple[400]),
                  textStyle: MaterialStateProperty.all(
                      TextStyle(color: Colors.white))),
              onPressed: () async {
                if(_formKey.currentState!.validate()) {
                  dynamic result = await _auth.register(email, firstName, lastName, date, password);
                  if (result == null) {
                    setState(() {
                        error = 'please supply a valid email';
                    });
                  }
                }
              }
            ),
            SizedBox(height: 12.0),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            )
          ],

        ),
      ),
    ),
    );
  }
}
