import 'package:flutter/material.dart';
import 'package:flutter_idealz/src/ui/select_currency.dart';
import 'package:flutter_idealz/src/utils/_color.dart';
import 'package:flutter_idealz/src/utils/app_utils.dart';

class SelectLanguage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LanguageState();
}

class LanguageState extends State<SelectLanguage> {
  final titles = [
    'English',
    'Arabic',
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return languageSelectBody(context);
  }

  Widget languageSelectBody(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          // Define the default brightness and colors.
          backgroundColor: HexColor(bg_color),

          accentColor: HexColor(txt_color),

          // Define the default font family.
          fontFamily: 'Catamaran',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Catamaran'),
            title: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            body1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
        ),
        home: new Material(
            child: new Scaffold(
          body: SafeArea(
              top: false,
              child: new Container(
                decoration: BoxDecoration(color: HexColor(bg_color)),
                margin: EdgeInsets.only(top: 20.0),
                child: Center(
                    child: new Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new Text(
                        "Select Language",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Catamaran'),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Container(
                        width: 250,
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: titles.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                listItemClick(index);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Container(
                                    child: Card(
                                        // <-- Card widget
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                new Radius.circular(10.0))),
                                        child: Center(
                                            child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: new Text(
                                            titles[index],
                                            style: TextStyle(
                                                color: HexColor(txt_color),
                                                fontFamily: "Catamaran",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18),
                                          ),
                                        )))),
                              ),
                            );
                          },
                        ),
                      ),
                    ))
                  ],
                )),
              )),
        )));
  }

  void listItemClick(int index) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SelectCurrency()),
        ModalRoute.withName("/SelectCurrency"));
  }
}
