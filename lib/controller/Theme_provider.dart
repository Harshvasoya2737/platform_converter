import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  int thememode = 0;

  ThemeData getlight() {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black87),
      ),
    );
  }

  void changetheme(int type) {
    thememode = type;
    notifyListeners();
  }

  ThemeData getdark() {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: Colors.white),
      ),
    );
  }

  CupertinoThemeData getiosdark() {
    return CupertinoThemeData(
      barBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      textTheme: CupertinoTextThemeData(),
    );
  }

  CupertinoThemeData getioslight() {
    return CupertinoThemeData(
      barBackgroundColor: Colors.white,
      brightness: Brightness.light,
      textTheme: CupertinoTextThemeData(),
    );
  }

  ThemeMode gettheme(value) {
    if (thememode == 1) {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }
}
