import 'package:flutter/material.dart';
import 'package:flutter_idealz/src/api_utils/NetworkUtil.dart';
import 'package:flutter_idealz/src/api_utils/RestApiCalls.dart';
import 'package:flutter_idealz/src/custom_ui/custom_app_bar.dart';
import 'package:flutter_idealz/src/modals/registration_data.dart';
import 'package:flutter_idealz/src/ui/login.dart';
import 'package:flutter_idealz/src/utils/_color.dart';
import 'package:flutter_idealz/src/utils/app_constants.dart';
import 'package:flutter_idealz/src/utils/app_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_idealz/src/modals/item_currency.dart';

class Settings extends StatefulWidget {
  static const String _title = App_Name;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SettingPage();
  }
}

class SettingPage extends State<Settings> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  SharedPreferences sharedPreferences;
  bool userData = false;

  List<CurrencyItem> _listCurrency = new List();

  var currencies = [
    'INR',
    'EUR',
    'USD',
    'INR',
    'EUR',
    'USD',
    'INR',
    'EUR',
    'USD'
  ];
  var currencie = [
    'INR',
    'EUR',
    'USD',
    'INR',
    'EUR',
    'USD',
    'INR',
    'EUR',
    'USD'
  ];

  var currentItem = 'INR';

  int _radioValue1 = -1;
  bool _logoutSectionVisible = false;

  String _name = "Singed in as", _email, _helloText;

  int _id;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
      print(_radioValue1);
      switch (_radioValue1) {
        case 0:
          currencies.addAll(currencie);
          break;
        case 1:
          //Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("Female"),));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    updateList();
    getUserData();
    return Scaffold(
        appBar: new CustomAppBar(onTap: () => Close()),
        body: Container(
            decoration: BoxDecoration(color: HexColor(bg_color)),
            child: new SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: new Column(children: <Widget>[
                  Visibility(
                    visible: !_logoutSectionVisible,
                    child: Container(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Get Started!',
                              style: TextStyle(
                                  fontFamily: "Catamaran",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                  fontStyle: FontStyle.normal,
                                  color: HexColor(txt_color)),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Container(
                            child: new RaisedButton(
                              padding: const EdgeInsets.only(
                                  top: 20,
                                  bottom: 20.0,
                                  left: 30.0,
                                  right: 30.0),
                              elevation: 4,
                              textColor: Colors.white,
                              color: Colors.blue,
                              child: new Text(
                                "Login or Register",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    fontFamily: "Catamaran",
                                    fontWeight: FontWeight.w600),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(10.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _logoutSectionVisible,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: new Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0,
                                      bottom: 0,
                                      right: 0,
                                      left: 0.0),
                                  child: Text(
                                    '$_helloText',
                                    style: new TextStyle(
                                        color: HexColor(txt_color),
                                        fontSize: 25.0,
                                        fontFamily: "Catamaran",
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20.0),
                            height: 1.5,
                            color: HexColor(setting_line_color),
                          ),
                          Container(
                            child: new Column(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(top: 20.0),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Personal Details',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.normal,
                                        color: HexColor(txt_color),
                                        fontFamily: "Catamaran",
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20.0),
                                  height: 1.5,
                                  color: HexColor(setting_line_color),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20.0),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Active Tickets',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.normal,
                                        color: HexColor(txt_color),
                                        fontFamily: "Catamaran",
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20.0),
                                  height: 1.5,
                                  color: HexColor(setting_line_color),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20.0),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Levels',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.normal,
                                        color: HexColor(txt_color),
                                        fontFamily: "Catamaran",
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20.0),
                                  height: 1.5,
                                  color: HexColor(setting_line_color),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20.0),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'iPoints',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.normal,
                                        color: HexColor(txt_color),
                                        fontFamily: "Catamaran",
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20.0),
                                  height: 1.5,
                                  color: HexColor(setting_line_color),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20.0),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Wishlist',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.normal,
                                        color: HexColor(txt_color),
                                        fontFamily: "Catamaran",
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20.0),
                                  height: 1.5,
                                  color: HexColor(setting_line_color),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20.0),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Inivte friend and earn iPoints',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.blue,
                                        fontFamily: "Catamaran",
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20.0),
                                  height: 1.5,
                                  color: HexColor(setting_line_color),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: new Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 0, right: 0, left: 0.0),
                          child: Text(
                            "Settings",
                            style: new TextStyle(
                                color: HexColor(txt_color),
                                fontSize: 25.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Catamaran"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    height: 1.5,
                    color: HexColor(setting_line_color),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            'Currency',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontStyle: FontStyle.normal,
                              color: HexColor(txt_color),
                              fontFamily: "Catamaran",
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Container(
                            child: new Row(
                          children: <Widget>[
                            new InkWell(
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Text("INR",
                                        style: TextStyle(color: Colors.blue)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 3.0),
                                      child:
                                          Image.asset("assets/down_arrow.png"),
                                    )
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                              ),
                              onTap: () => _settingModalBottomSheet(context),
                            )
                          ],
                        )),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    height: 1.5,
                    color: HexColor(setting_line_color),
                  ),
                  Container(
                    child: new Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 0, right: 0, left: 0.0),
                          child: Text(
                            "General",
                            style: new TextStyle(
                                color: HexColor(txt_color),
                                fontSize: 25.0,
                                fontFamily: "Catamaran",
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    height: 1.5,
                    color: HexColor(setting_line_color),
                  ),
                  Container(
                    child: new Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            'How It Works',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontStyle: FontStyle.normal,
                                color: HexColor(txt_color),
                                fontFamily: "Catamaran",
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          height: 1.5,
                          color: HexColor(setting_line_color),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Products',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontStyle: FontStyle.normal,
                                color: HexColor(txt_color),
                                fontFamily: "Catamaran",
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          height: 1.5,
                          color: HexColor(setting_line_color),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Charities',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontStyle: FontStyle.normal,
                                color: HexColor(txt_color),
                                fontFamily: "Catamaran",
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          height: 1.5,
                          color: HexColor(setting_line_color),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: new FlatButton(
                            color: HexColor(gray_button_color),
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                left: 40.0,
                                right: 40.0),
                            textColor: Colors.white,
                            child: new Text(
                              "Call us",
                              style: TextStyle(
                                color: HexColor(txt_color),
                                fontSize: 14.0,
                                fontFamily: "Catamaran",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onPressed: () {},
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                          ),
                        ),
                        Container(
                          child: new FlatButton(
                            color: HexColor(gray_button_color),
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                left: 40.0,
                                right: 40.0),
                            textColor: HexColor(txt_color),
                            child: new Text(
                              "Email us",
                              style: TextStyle(
                                  color: HexColor(txt_color),
                                  fontSize: 14.0,
                                  fontFamily: "Catamaran",
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {},
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FloatingActionButton(
                          elevation: 0.2,
                          heroTag: "fab1",
                          backgroundColor: Colors.white,
                          child: Image.asset("assets/instagram_menu.png"),
                          onPressed: () {},
                        ),
                        FloatingActionButton(
                          elevation: 0.2,
                          heroTag: "fab2",
                          backgroundColor: Colors.white,
                          child: Image.asset("assets/facebook_menu.png"),
                          onPressed: () {},
                        ),
                        FloatingActionButton(
                          elevation: 0.2,
                          heroTag: "fab3",
                          backgroundColor: Colors.white,
                          child: Image.asset("assets/whatsapp.png"),
                          onPressed: () {},
                        ),
                        FloatingActionButton(
                          elevation: 0.2,
                          heroTag: "fab4",
                          backgroundColor: Colors.white,
                          child: Image.asset("assets/linkdin.png"),
                          onPressed: () {},
                        ),
                        FloatingActionButton(
                          elevation: 0.2,
                          heroTag: "fab5",
                          backgroundColor: Colors.white,
                          child: Image.asset("assets/twitter.png"),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: new Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            'User Agreement',
                            style: TextStyle(
                                fontSize: 13.0,
                                fontStyle: FontStyle.normal,
                                fontFamily: "Catamaran",
                                fontWeight: FontWeight.w500,
                                color: HexColor(setting_screen_txt_color)),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Draw Terms And Conditions',
                            style: TextStyle(
                                fontSize: 13.0,
                                fontStyle: FontStyle.normal,
                                fontFamily: "Catamaran",
                                fontWeight: FontWeight.w500,
                                color: HexColor(setting_screen_txt_color)),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Frequently Asked Questions',
                            style: TextStyle(
                                fontSize: 13.0,
                                fontStyle: FontStyle.normal,
                                fontFamily: "Catamaran",
                                fontWeight: FontWeight.w500,
                                color: HexColor(setting_screen_txt_color)),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                                fontSize: 13.0,
                                fontStyle: FontStyle.normal,
                                fontFamily: "Catamaran",
                                fontWeight: FontWeight.w500,
                                color: HexColor(setting_screen_txt_color)),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Visibility(
                          visible: _logoutSectionVisible,
                          child: Container(
                            alignment: Alignment.topLeft,
                            key: _scaffoldKey,
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 20.0, bottom: 20.0),
                                    height: 1.5,
                                    color: HexColor(setting_line_color),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.transparent),
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      '$_name',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: "Catamaran",
                                          fontWeight: FontWeight.w600,
                                          color: HexColor(txt_color)),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.transparent),
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      '$_email',
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: "Catamaran",
                                          fontWeight: FontWeight.w500,
                                          color:
                                              HexColor(sub_heading_text_color)),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  new InkWell(
                                    onTap: () => {logout()},
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.transparent),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          'Log out',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontStyle: FontStyle.normal,
                                              fontFamily: "Catamaran",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.blue),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            )));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

  Close() {
    print("Ji");
    Navigator.pop(context);
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10.0, right: 12.0, left: 12.0),
                  child: new Container(
                      child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Choose Currency",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: HexColor(txt_color),
                            fontWeight: FontWeight.w600,
                            fontFamily: "Catamaran"),
                      ),
                      Text(""),
                      new InkWell(
                        child: Text(
                          "Done",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Catamaran"),
                        ),
                        onTap: () => currencyChoose(),
                      )
                    ],
                  )),
                ),
                Container(
                  height: 300,
                  child: Center(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: currencies.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            /*currencyChoose();*/
                            CommonUtils.showToast(
                                msg: "Show", bgColor: Colors.blue);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: new Container(
                                child: Card(
                                    // <-- Card widget
                                    elevation: 0.2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          new Text(
                                            _listCurrency.elementAt(index).name,
                                            style: TextStyle(
                                                color: HexColor(txt_color),
                                                fontFamily: "Catamaran",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18),
                                          ),
                                          new Text(""),
                                          IconButton(
                                            icon: new Image.asset(_listCurrency
                                                    .elementAt(index)
                                                    .isSelect
                                                ? "assets/tick_icon.png"
                                                : "assets/unselected_tick_icon.png"),
                                            onPressed: () {
                                              CurrencyItem item = _listCurrency
                                                  .elementAt(index);
                                              if (_listCurrency
                                                  .elementAt(index)
                                                  .isSelect) {
                                                item.isSelect = false;
                                              } else {
                                                item.isSelect = true;
                                              }

                                              setState(() {
                                                _listCurrency[index] = item;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                    ))),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  currencyChoose() {
    Navigator.pop(context);
  }

  Future getUserData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    bool b;
    if (sharedPreferences.get(LoginConstants.IS_USER_LOGIN) != null) {
      b = sharedPreferences.getBool(LoginConstants.IS_USER_LOGIN);
    } else {
      b = false;
    }

    if (b) {
      //User Login
      setState(() => _logoutSectionVisible = true);
      if (!userData) {
        doGetUserData(sharedPreferences.getString(LoginConstants.TOKEN));
      }
    } else {
      setState(() => _logoutSectionVisible = false);
    }
  }

  doGetUserData(String token) {
    CommonUtils.showDialogProgress(context);
    RestApiCalls api = new RestApiCalls();
    api.getUserData(token).then((RegistrationData data) {
      CommonUtils.dismissDialogProgress(context);
      setState(() {
        _name = "Singed in as " + data.firstname + " " + data.lastname;
        _email = "using email " + data.email;
        _helloText = "Hello " + data.firstname;
        _id = data.id;
        userData = true;
      });
    }).catchError(
        (Object error) => {CommonUtils.dismissDialogProgress(context)});
  }

  logout() async {
    CommonUtils.showDialogProgress(context);
    sharedPreferences = await SharedPreferences.getInstance();
    var customerId = _id;
    var body = '{"customer_id" : $customerId }';
    RestApiCalls api = new RestApiCalls();
    api.logoutUser(body).then((bool data) {
      CommonUtils.dismissDialogProgress(context);
      if (data) {
        CommonUtils.showToast(msg: "Logout Successfully", bgColor: Colors.blue);
        setState(() => _logoutSectionVisible = false);
        sharedPreferences.clear();
        sharedPreferences.setBool(SharedPrefConstants.IS_FIRST_TIME, true);
      } else {}
    }).catchError(
        (Object error) => {CommonUtils.dismissDialogProgress(context)});
  }

  void updateList() {
    for (var i = 0; i < 10; i++) {
      setState(() {
        _listCurrency.add(CurrencyItem(name: "INR", isSelect: false));
      });
    }
  }
}
