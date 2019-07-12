// Flutter code sample for material.AppBar.actions.1

// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'package:flutter/material.dart';
import 'package:flutter_idealz/src/ui/splash_screen.dart';
import 'package:flutter_idealz/src/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = App_Name;
  SharedPreferences sharedPreferences;
  bool b = false;

  @override
  Widget build(BuildContext context) {
    /*checkUserIsFirstTime();*/
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(accentColor: Colors.black, primaryColor: Colors.black),
      home: SplashScreen(),
    );
  }

  Future checkUserIsFirstTime() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool(SharedPrefConstants.IS_FIRST_TIME) != null) {
      b = sharedPreferences.getBool(SharedPrefConstants.IS_FIRST_TIME);
      print(b);
    }
  }
}
