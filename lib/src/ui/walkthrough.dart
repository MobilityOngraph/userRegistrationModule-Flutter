import 'package:flutter/material.dart';
import 'package:flutter_idealz/src/ui/login.dart';
import 'package:flutter_idealz/src/ui/select_language.dart';
import 'package:flutter_idealz/src/utils/_color.dart';
import 'package:flutter_idealz/src/utils/app_constants.dart';
import 'package:flutter_idealz/src/utils/app_utils.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class walkthrough_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return walkthroughState();
  }
}

class walkthroughState extends State<walkthrough_screen> {
  PageController _controller =
      new PageController(initialPage: 0, viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: PageIndicatorContainer(
                    pageView: PageView(
                      controller: _controller,
                      physics: AlwaysScrollableScrollPhysics(),
                      children: <Widget>[walk1(), walk2(), walk3()],
                      scrollDirection: Axis.horizontal,
                    ),
                    align: IndicatorAlign.bottom,
                    length: 3,
                    indicatorSpace: 8.0,
                    indicatorSelectorColor: Colors.blue,
                    indicatorColor: Colors.grey,
                    shape: IndicatorShape.circle(size: 8.0),
                  )),
              new Container(
                margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.,
                  children: <Widget>[
                    new Expanded(
                        child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: new Text(
                          "Get Started",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontFamily: "Catamaran",
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      onPressed: () async {
                        SharedPreferences sharedPreferences;
                        sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.setBool(
                            SharedPrefConstants.IS_FIRST_TIME, true);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectLanguage()),
                            ModalRoute.withName("/SelectLanguage"));
                      },
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget walk1() => new Scaffold(
      body: new Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                child: new Image.asset(
                  'assets/walk_through1.png',
                ),
              ),
              Container(
                child: Text(
                  'text text whateever extra retrtrtr',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: HexColor(txt_color),
                      fontFamily: "Catamaran",
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                child: Text(
                    'text text whateever extra retrtrtr fgdfvfv vfvfvfv',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: HexColor(txt_color),
                        fontFamily: "Catamaran",
                        fontWeight: FontWeight.w500)),
              )
            ],
          ),
        ),
      ),
    );

Widget walk2() => new Scaffold(
      body: new Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                child: new Image.asset(
                  'assets/walkthrough2.png',
                ),
              ),
              Container(
                child: Text(
                  'text text whateever extra retrtrtr',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: HexColor(txt_color),
                      fontFamily: "Catamaran",
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                child: Text(
                    'text text whateever extra retrtrtr fgdfvfv vfvfvfv',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: HexColor(txt_color),
                        fontFamily: "Catamaran",
                        fontWeight: FontWeight.w500)),
              )
            ],
          ),
        ),
      ),
    );

Widget walk3() => new Scaffold(
      body: new Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                child: new Image.asset(
                  'assets/walkthrough3.png',
                ),
              ),
              Container(
                child: Text(
                  'text text whateever extra retrtrtr',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: HexColor(txt_color),
                      fontFamily: "Catamaran",
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                child: Text(
                    'text text whateever extra retrtrtr fgdfvfv vfvfvfv',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: HexColor(txt_color),
                        fontFamily: "Catamaran",
                        fontWeight: FontWeight.w500)),
              )
            ],
          ),
        ),
      ),
    );
