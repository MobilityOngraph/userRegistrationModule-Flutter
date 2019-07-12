import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '_color.dart';

showSnackbar(GlobalKey<ScaffoldState> scaffoldState, String message,
    {MaterialColor materialColor}) {
  if (message.isEmpty) return;
  // Find the Scaffold in the Widget tree and use it to show a SnackBar
  scaffoldState.currentState.showSnackBar(
      SnackBar(content: Text(message), backgroundColor: materialColor));
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class Validator {
  static String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  static String isEmpty(String value) {
    if (value.isEmpty)
      return 'Please fill the field';
    else
      return null;
  }

  static String validatePassword(String value) {
    Pattern pattern = r'^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{6,50})$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Password must have characters: Lower Case, Upper Case, Digits, Special Characters.';
    else
      return null;
  }

  static String validatePhoneNumber(String value) {

    Pattern pattern = r'^(?:[+0]9)?[0-9]{8,12}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
    return 'Please enter valid phone number';
    else
    return null;
    // Indian Mobile number are of 10 digit only
    /*if (value.length > 8 && value.length < 12)
      return 'Please enter valid phone number';
    if (value.isEmpty)
      return 'Phone Number is required';
    else
      return null;*/
  }

  static String sameString(String value, String matchValue) {
    // Indian Mobile number are of 10 digit only
    if (value.isEmpty) return 'Confirm Password is required';
    if (!(value.trim() == matchValue.trim()))
      return 'Password and Confirm Password do not match';
    else
      return null;
  }
}

class CommonUtils {
  static Future<bool> isNetworkAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        //  print('connected');
        return true;
      }
    } on SocketException catch (_) {
      //print('not connected');
      return false;
    }
  }

  static void showDialogProgress(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {},
            child: Center(
              child: SpinKitRipple(color: Colors.blue, size: 60.0),
            ),
          );
        });
  }

  static void showDialogProgressWithMessage(
      {Key key, BuildContext context, String msg}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: Card(
              margin: EdgeInsets.only(left: 30, right: 30),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 70.0,
                  child: WillPopScope(
                    onWillPop: () {},
                    child: Center(
                      child: new Scaffold(
                        backgroundColor: Colors.white,
                        body: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SpinKitRipple(color: Colors.blue, size: 50.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  msg,
                                  style: TextStyle(
                                      color: HexColor(txt_color),
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Catamaran"),
                                ),
                              )
                            ],
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  static void dismissDialogProgress(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void showSnackbar(
      GlobalKey<ScaffoldState> scaffoldState, String message,
      {MaterialColor materialColor}) {
    if (message.isEmpty) return;
    // Find the Scaffold in the Widget tree and use it to show a SnackBar
    scaffoldState.currentState.showSnackBar(
        SnackBar(content: Text(message), backgroundColor: materialColor));
  }

  static void showToast({Key key, String msg, Color bgColor}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: bgColor,
        textColor: Colors.white,
        fontSize: 13.0);
  }
}
