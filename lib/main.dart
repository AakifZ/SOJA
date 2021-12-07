import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soja/screens/home/home.dart';
import 'package:soja/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:soja/services/LocaleString.dart';
import 'package:soja/services/MyThemes.dart';
import 'package:soja/services/auth.dart';
import 'package:soja/services/changeTheme.dart';
import 'package:soja/settings/settings_page.dart';
import 'package:get/get.dart';
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
          child: GetMaterialApp(
            translations: LocalString(),
            locale: Locale('en', 'US'),
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home: Wrapper(),
          ),
        );
      });
  }









