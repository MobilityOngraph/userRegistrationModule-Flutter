import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_idealz/src/ui/walkthrough.dart';
import 'package:flutter_idealz/src/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard.dart';

class SplashScreen extends StatefulWidget {
  int countdown;

  SplashScreen({Key key, bool isFirstTime});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Splash();
  }
}

class Splash extends State<SplashScreen> {
  SharedPreferences sharedPreferences;
  bool b = false;

  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 4),
        () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => b ? Dashboard() : walkthrough_screen()),
            ModalRoute.withName(b ? "/Dashboard" : "/walkthrough_screen"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    checkUserIsFirstTime();
    return new Scaffold(
      body: Image.asset("assets/splash.png"),
    );
  }

  Future checkUserIsFirstTime() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool(SharedPrefConstants.IS_FIRST_TIME) != null) {
      setState(() =>
          b = sharedPreferences.getBool(SharedPrefConstants.IS_FIRST_TIME));
    }
  }
}
