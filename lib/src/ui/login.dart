import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_idealz/src/modals/login_data.dart';
import 'package:flutter_idealz/src/modals/login_request.dart';
import 'package:flutter_idealz/src/mvp/logincontract.dart';
import 'package:flutter_idealz/src/ui/forget_password.dart';
import 'package:flutter_idealz/src/ui/regsitartion_page.dart';
import 'package:flutter_idealz/src/utils/_color.dart';
import 'package:flutter_idealz/src/utils/app_utils.dart';
import 'package:flutter_idealz/src/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:flutter_idealz/src/utils/app_defaults.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with LoginScreenContract {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final textControllers1 = new TextEditingController();
  final textControllers2 = new TextEditingController();
  String _email, _password;
  SharedPreferences sharedPreferences;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _autoValidate = false;
  LoginScreenPresenter loginScreenPresenter;

  bool _btnEnabled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textControllers1.addListener(() {
      print(textControllers1.text);
      if (textControllers1.text.isNotEmpty &&
          Validator.validateEmail(textControllers1.text) == null &&
          Validator.validatePassword(textControllers2.text) == null) {
        setState(() => _btnEnabled = true);
      } else {
        setState(() => _btnEnabled = false);
      }
    });

    textControllers2.addListener(() {
      if (textControllers1.text.isNotEmpty &&
          Validator.validateEmail(textControllers1.text) == null &&
          Validator.validatePassword(textControllers2.text) == null) {
        setState(() => _btnEnabled = true);
      } else {
        setState(() => _btnEnabled = false);
      }
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textControllers1.dispose();
    textControllers2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    loginScreenPresenter = new LoginScreenPresenter(this);
    return new Scaffold(
      key: _scaffoldKey,
      body: new Material(
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: new SingleChildScrollView(
              child: new Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: IconButton(
                            icon: Icon(Icons.arrow_back_ios,
                                color: HexColor(txt_color)),
                            onPressed: () async => {
                                  // Write code of on back button
                                  Navigator.pop(context)
                                }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0, bottom: 0, right: 0, left: 15),
                        child: Text(
                          "Please Sign in",
                          style: new TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Catamaran"),
                        ),
                      ),
                      new Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: new BorderRadius.all(
                                const Radius.circular(15.0)),
                            border: Border.all(
                                color: HexColor("efefef"), width: 1.0)),
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Expanded(
                              child: TextFormField(
                                controller: textControllers1,
                                keyboardType: TextInputType.emailAddress,
                                validator: Validator.validateEmail,
                                onSaved: (String val) {
                                  setState(() {
                                    _email = val;
                                  });
                                },
                                obscureText: false,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: LoginConstants.LoginEmailText,
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "Catamaran",
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      new Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: new BorderRadius.all(
                                const Radius.circular(15.0)),
                            border: Border.all(
                                color: HexColor("efefef"), width: 1.0)),
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Expanded(
                              child: TextFormField(
                                controller: textControllers2,
                                validator: Validator.validatePassword,
                                onSaved: (String value) {
                                  _password = value;
                                },
                                obscureText: true,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "Catamaran",
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      new Container(
                          padding: const EdgeInsets.only(left: 5.0),
                          margin: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 20.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.topLeft,
                                child: new InkWell(
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.grey,
                                        fontFamily: "Catamaran",
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.right,
                                  ),
                                  onTap: () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgetPassword()),
                                        )
                                      },
                                ),
                              ),
                              Container(
                                child: new FlatButton(
                                  disabledColor: HexColor(gray_button_color),
                                  padding: const EdgeInsets.only(
                                      top: 20,
                                      bottom: 20.0,
                                      left: 40.0,
                                      right: 40.0),
                                  textColor: Colors.white,
                                  color: _btnEnabled
                                      ? Colors.blue
                                      : HexColor(gray_button_color),
                                  child: new Text(
                                    "Sign in",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontFamily: "Catamaran",
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onPressed: () {
                                    if (_validateInput()) {
                                      CommonUtils.isNetworkAvailable()
                                          .then((resp) async {
                                        if (resp) {
                                          CommonUtils
                                              .showDialogProgressWithMessage(
                                                  context: context,
                                                  msg: "Please wait...");

                                          LoginRequest request =
                                              new LoginRequest(
                                            username: _email,
                                            password: _password,
                                          );
                                          final dyn = request.toJson();
                                          print(jsonEncode(dyn));
                                          String bdy = jsonEncode(dyn);
                                          loginScreenPresenter.doLogin(bdy);
                                          _scaffoldKey.currentState
                                              .removeCurrentSnackBar();
                                        } else
                                          CommonUtils.showSnackbar(
                                              _scaffoldKey,
                                              LoginConstants
                                                  .NETWORK_NOT_AVAILABLE);
                                      });
                                    } else {
                                      CommonUtils.showSnackbar(_scaffoldKey,
                                          LoginConstants.FILL_VALID_INPUTS);
                                    }
                                  },
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0)),
                                ),
                              )
                            ],
                          )),
                      new Container(
                        margin: const EdgeInsets.only(top: 50.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new InkWell(
                                child: Text(
                                  LoginConstants.NewUserText,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontStyle: FontStyle.normal,
                                      color: HexColor("0088cc")),
                                  textAlign: TextAlign.right,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()),
                                  );
                                }),
                          ],
                        ),
                      )
                    ],
                  )),
            )),
      ),
    );
  }

  bool _validateInput() {
    if (_formKey.currentState.validate()) {
      // If all data are correct then save data to out variables
      _formKey.currentState.save();
      return true;
    } else {
      // If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
      return false;
    }
  }

  @override
  void onLoginError(String errorTxt) {
    print("Error Text : " + errorTxt);
    CommonUtils.dismissDialogProgress(context);
    if (errorTxt.toString() == "Exception: 401") {
      CommonUtils.showSnackbar(_scaffoldKey, "Invalid Credentials");
    } else {
      CommonUtils.showSnackbar(_scaffoldKey, ApiConstants.SERVER_ERROR);
    }
  }

  @override
  Future onLoginSuccess(LoginData user) async {
    CommonUtils.dismissDialogProgress(context);
    print("Token : " + user.token);

    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();

    sharedPreferences.setBool(LoginConstants.IS_USER_LOGIN, true);
    sharedPreferences.setString(LoginConstants.TOKEN, user.token);
    CommonUtils.showToast(msg: "Login Successfully", bgColor: Colors.blue);
    Navigator.pop(context);
  }
}
