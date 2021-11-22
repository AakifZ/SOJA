import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soja/models/user.dart';
import 'package:soja/screens/authenticate/authenticate.dart';
import 'package:soja/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    print(user);
    // return either home or authenticate widget
    if(user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
