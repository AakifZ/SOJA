import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:soja/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:soja/services/auth.dart';

import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: AuthService().user,
      catchError: (User, MyUser) => null,
      initialData: null,
      child: MaterialApp(
      home: Wrapper(),
      ),
    );
  }



}
