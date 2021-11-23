import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:soja/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:soja/services/MyThemes.dart';
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
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return StreamProvider<MyUser?>.value(
          value: AuthService().user,
          catchError: (User, MyUser) => null,
          initialData: null,
          child: MaterialApp(
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home: Wrapper(),
          ),
        );
      });
  }





