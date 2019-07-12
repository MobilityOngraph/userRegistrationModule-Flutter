// Flutter code sample for material.AppBar.actions.1

// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'package:flutter/material.dart';
import 'package:flutter_idealz/src/utils/app_constants.dart';
import 'package:flutter_idealz/src/utils/app_defaults.dart';
import 'package:flutter_idealz/src/utils/app_utils.dart';
import 'package:flutter_idealz/src/ui/home.dart';

/// This Widget is the main application widget.
class HomeOne extends StatelessWidget {
  static const String _title = App_Name;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
          accentColor: Colors.orange, primaryColor: const Color(0xFFDE4435)),
      home: Page(),
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
            child: new Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              top: 10.0, bottom: 10.0, right: 8.0, left: 8.0),
          child: Text(
            "Please Sign in",
            textAlign: TextAlign.start,
            style: new TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Enter your username'),
        ),
        RaisedButton(onPressed: onTap(), child: new Text("Add")),
      ],
    )));
  }
}

onGet() {
  /*int value = new SharedPrefHelper().getWithDefault("key", 0) as int;
  print(value);*/
}

onTap() {
  new SharedPrefHelper().save("Key", 123);
}
