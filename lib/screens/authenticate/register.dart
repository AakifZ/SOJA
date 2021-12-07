import 'package:flutter/material.dart';
import 'package:soja/services/auth.dart';
import 'package:soja/shared/constants.dart';
import 'package:soja/shared/loading.dart';

class Register extends StatefulWidget {
  final Function? toggleView;
  Register({this.toggleView});


  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  // text field state
  String email = '';
  String username = '';
  String firstName = '';
  String lastName = '';
  String date = '';
  String gender = '';
  String password = '';
  String error = '';

  String getEmail() {
    return email;
  }

  String getUsername() {
    return username;
  }

  String getFirstName() {
    return firstName;
  }

  String getLastName() {
    return lastName;
  }

  String getDate() {
    return date;
  }

  String getGender() {
    return gender;
  }

  String getPassword() {
    return password;
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
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
                style: TextStyle(color: Colors.black),
                decoration: textInputDecoration.copyWith(hintText: 'Enter Email'),
              validator: (val) => val!.isEmpty ? 'Enter email' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                }
            ),
            SizedBox(height: 20.0,),
            TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: textInputDecoration.copyWith(hintText: 'Enter Username'),
                validator: (val) => val!.isEmpty ? 'Enter username' : null,
                onChanged: (val) {
                  setState(() {
                    username = val;
                  });
                }
            ),
            SizedBox(height: 20.0,),
            TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: textInputDecoration.copyWith(hintText: 'Enter First Name'),
                validator: (val) => val!.isEmpty ? 'Enter first name' : null,
                onChanged: (val) {
                  setState(() {
                    firstName = val;
                  });
                }
            ),
            SizedBox(height: 20.0,),
            TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: textInputDecoration.copyWith(hintText: 'Enter Last Name'),
                validator: (val) => val!.isEmpty ? 'Enter last name' : null,
                onChanged: (val) {
                  setState(() {
                    lastName = val;
                  });
                }
            ),
            SizedBox(height: 20.0,),
            TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: textInputDecoration.copyWith(hintText: 'Date of Birth'),
                validator: (val) => val!.isEmpty ? 'Enter date of birth' : null,
                onChanged: (val) {
                  setState(() {
                    date = val;
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
            Text('Select Your Gender'),
            Radio<String>(
              value: "Male",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),
            Text("Male"),
            Radio<String>(
              value: "Female",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),
            Text("Female"),
            Radio<String>(
              value: "Nonbinary",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),
            Text("Nonbinary"),
            SizedBox(height: 20.0,),
            ElevatedButton(
              child: Text('Register'),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.purple[400]),
                  textStyle: MaterialStateProperty.all(
                      TextStyle(color: Colors.white))),
              onPressed: () async {
                if(_formKey.currentState!.validate() && gender.isNotEmpty) {
                  setState(() => loading = true);
                  dynamic result = await _auth.register(email, username, firstName, lastName, date, password, gender);
                  if (result == null && gender.isEmpty) {
                    setState(() {
                        error = 'please fill the required credentials';
                        loading = false;
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
