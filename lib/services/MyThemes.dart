import 'package:flutter/material.dart';

//Here is the color change effect class that allows the user to switch from light to dark mode.
class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
class MyThemes {
  //Dark mode method
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),

  );

  //Lgith mode method
  static final lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
  );
}