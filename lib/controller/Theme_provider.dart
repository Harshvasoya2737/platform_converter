import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  int themeMode = 0;

  ThemeData getLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.black87,
    );
  }

  ThemeData getDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.white,
    );
  }

  CupertinoThemeData getIosDarkTheme() {
    return CupertinoThemeData(
      barBackgroundColor: Colors.black,
      brightness: Brightness.dark,
    );
  }

  CupertinoThemeData getIosLightTheme() {
    return CupertinoThemeData(
      barBackgroundColor: Colors.white,
      brightness: Brightness.light,
    );
  }

  ThemeMode getThemeMode() {
    return themeMode == 1 ? ThemeMode.light : ThemeMode.dark;
  }

  void changeTheme(int type) {
    themeMode = type;
    notifyListeners();
  }
}
