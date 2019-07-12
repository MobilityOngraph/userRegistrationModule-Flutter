import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_idealz/src/modals/registration_data.dart';
import 'package:flutter_idealz/src/modals/registration_request.dart';
import 'package:flutter_idealz/src/mvp/RegistartionContract.dart';
import 'package:flutter_idealz/src/utils/app_constants.dart';
import 'package:flutter_idealz/src/utils/app_utils.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:flutter_idealz/src/utils/_color.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  RegisterForm createState() => RegisterForm();
}

class RegisterForm extends State<RegisterPage> with RegistrationScreenContract {
  int _radioValue1 = -1;
  Country _selected;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _autoValidate = false;
  bool _btnEnabled = false;

  final textController1 = new TextEditingController();
  final textController2 = new TextEditingController();
  final textController3 = new TextEditingController();
  final textController4 = new TextEditingController();
  final textController5 = new TextEditingController();
  final textController6 = new TextEditingController();

  RegistrationScreenPresenter registrationScreenPresenter;

  String _email = "",
      _lName = "",
      _fName = "",
      _password = "",
      _phoneNumber = "",
      _promoCode = "",
      _gender = "";

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          _gender = "Male";
          break;
        case 1:
          _gender = "Female";
          break;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textController1.addListener(() {
      print(textController1.text);
      if (textController1.text.isNotEmpty &&
          textController2.text.isNotEmpty &&
          Validator.validateEmail(textController3.text) == null &&
          Validator.validatePassword(textController4.text) == null &&
          Validator.sameString(textController4.text, textController5.text) ==
              null &&
          Validator.validatePhoneNumber(textController6.text) == null) {
        setState(() => _btnEnabled = true);
      } else {
        setState(() => _btnEnabled = false);
      }
    });
    textController2.addListener(() {
      print(textController1.text);
      if (textController1.text.isNotEmpty &&
          textController2.text.isNotEmpty &&
          Validator.validateEmail(textController3.text) == null &&
          Validator.validatePassword(textController4.text) == null &&
          Validator.sameString(textController4.text, textController5.text) ==
              null &&
          Validator.validatePhoneNumber(textController6.text) == null) {
        setState(() => _btnEnabled = true);
      } else {
        setState(() => _btnEnabled = false);
      }
    });
    textController3.addListener(() {
      print(textController1.text);
      if (textController1.text.isNotEmpty &&
          textController2.text.isNotEmpty &&
          Validator.validateEmail(textController3.text) == null &&
          Validator.validatePassword(textController4.text) == null &&
          Validator.sameString(textController4.text, textController5.text) ==
              null &&
          Validator.validatePhoneNumber(textController6.text) == null) {
        setState(() => _btnEnabled = true);
      } else {
        setState(() => _btnEnabled = false);
      }
    });
    textController4.addListener(() {
      print(textController1.text);
      if (textController1.text.isNotEmpty &&
          textController2.text.isNotEmpty &&
          Validator.validateEmail(textController3.text) == null &&
          Validator.validatePassword(textController4.text) == null &&
          Validator.sameString(textController4.text, textController5.text) ==
              null &&
          Validator.validatePhoneNumber(textController6.text) == null) {
        setState(() => _btnEnabled = true);
      } else {
        setState(() => _btnEnabled = false);
      }
    });
    textController5.addListener(() {
      print(textController1.text);
      if (textController1.text.isNotEmpty &&
          textController2.text.isNotEmpty &&
          Validator.validateEmail(textController3.text) == null &&
          Validator.validatePassword(textController4.text) == null &&
          Validator.sameString(textController4.text, textController5.text) ==
              null &&
          Validator.validatePhoneNumber(textController6.text) == null) {
        setState(() => _btnEnabled = true);
      } else {
        setState(() => _btnEnabled = false);
      }
    });
    textController6.addListener(() {
      print(textController1.text);
      if (textController1.text.isNotEmpty &&
          textController2.text.isNotEmpty &&
          Validator.validateEmail(textController3.text) == null &&
          Validator.validatePassword(textController4.text) == null &&
          Validator.sameString(textController4.text, textController5.text) ==
              null &&
          Validator.validatePhoneNumber(textController6.text) == null) {
        setState(() => _btnEnabled = true);
      } else {
        setState(() => _btnEnabled = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    registrationScreenPresenter = new RegistrationScreenPresenter(this);

    return new Material(
      child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: new Scaffold(
              resizeToAvoidBottomInset: true,
              key: _scaffoldKey,
              body: Form(
                key: _formKey,
                autovalidate: _autoValidate,
                child: new SingleChildScrollView(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: IconButton(
                            icon: Icon(Icons.arrow_back_ios,
                                color: HexColor(txt_color)),
                            onPressed: () => {
                                  // Write code of on back button
                                  Navigator.pop(context)
                                }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0, bottom: 0, right: 0, left: 15),
                        child: Text(
                          "Register",
                          style: new TextStyle(
                              fontSize: 30.0,
                              fontFamily: "Catamaran",
                              fontWeight: FontWeight.w700,
                              color: HexColor(txt_color)),
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
                                controller: textController1,
                                validator: Validator.isEmpty,
                                onSaved: (String val) {
                                  setState(() {
                                    _fName = val;
                                  });
                                },
                                obscureText: false,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'First name',
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
                            left: 15.0, right: 15.0, top: 20.0),
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
                                controller: textController2,
                                validator: Validator.isEmpty,
                                onSaved: (String val) {
                                  setState(() {
                                    _lName = val;
                                  });
                                },
                                obscureText: false,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Last name',
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
                              left: 15.0, right: 15.0, top: 20.0),
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.all(
                                  const Radius.circular(15.0)),
                              border: Border.all(
                                  color: HexColor("efefef"), width: 1.0)),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Radio(
                                value: 0,
                                groupValue: _radioValue1,
                                onChanged: _handleRadioValueChange1,
                              ),
                              new Text(
                                'Male',
                                style: new TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                    fontFamily: "Catamaran",
                                    fontWeight: FontWeight.w500),
                              ),
                              new Container(
                                height: 30.0,
                                width: 1.0,
                                color: HexColor("efefef"),
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                              ),
                              new Radio(
                                value: 1,
                                groupValue: _radioValue1,
                                onChanged: _handleRadioValueChange1,
                              ),
                              new Text(
                                'Female',
                                style: new TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                    fontFamily: "Catamaran",
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )),
                      new Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 20.0),
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
                                controller: textController3,
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
                                  hintText: 'Email address',
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
                            left: 15.0, right: 15.0, top: 20.0),
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
                                controller: textController4,
                                validator: Validator.validatePassword,
                                onSaved: (String val) {
                                  setState(() {
                                    _password = val;
                                  });
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
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 20.0),
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
                                controller: textController5,
                                validator: (String arg) {
                                  Validator.sameString(arg, _password);
                                },
                                onSaved: (String val) {
                                  setState(() {
                                    _password = val;
                                  });
                                },
                                obscureText: true,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Confirm password',
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
                          padding: const EdgeInsets.only(left: 5.0),
                          margin: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 20.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                height: 60.0,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: new BorderRadius.only(
                                        topLeft: const Radius.circular(15.0),
                                        bottomLeft:
                                            const Radius.circular(15.0)),
                                    border: Border.all(
                                        color: HexColor("efefef"), width: 1.0)),
                                padding: const EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                    top: 5.0,
                                    bottom: 5.0),
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    CountryPicker(
                                      dense: false,
                                      showFlag: false,
                                      //displays flag, true by default
                                      showDialingCode: true,
                                      //displays dialing code, false by default
                                      showName: false,
                                      //displays country name, true by default
                                      onChanged: (Country country) {
                                        setState(() {
                                          _selected = country;
                                        });
                                      },
                                      selectedCountry: _selected,
                                    )
                                  ],
                                ),
                              ),
                              new Expanded(
                                  child: Container(
                                height: 60.0,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: new BorderRadius.only(
                                        bottomRight:
                                            const Radius.circular(15.0),
                                        topRight: const Radius.circular(15.0)),
                                    border: Border.all(
                                        color: HexColor("efefef"), width: 1.0)),
                                padding: const EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                    top: 0.0,
                                    bottom: 0.0),
                                child: TextFormField(
                                  controller: textController6,
                                  keyboardType: TextInputType.phone,
                                  validator: Validator.validatePhoneNumber,
                                  onSaved: (String val) {
                                    setState(() {
                                      _phoneNumber =
                                          _selected.dialingCode + val;
                                      print(_phoneNumber +
                                          " " +
                                          _selected.dialingCode);
                                    });
                                  },
                                  obscureText: false,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Mobile No.',
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "Catamaran",
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ))
                            ],
                          )),
                      new Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 20.0),
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
                              child: TextField(
                                obscureText: false,
                                textAlign: TextAlign.left,
                                onChanged: (String val) => {_promoCode = val},
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Promo code',
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
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              FlatButton(
                                color: _btnEnabled
                                    ? Colors.blue
                                    : HexColor(gray_button_color),
                                onPressed: () {
                                  if (_validateInput()) {
                                    CommonUtils.isNetworkAvailable()
                                        .then((resp) async {
                                      if (resp) {
                                        CommonUtils
                                            .showDialogProgressWithMessage(
                                                context: context,
                                                msg: "Please wait...");

                                        if (_radioValue1 != -1) {
                                          //Registration done
                                          RegistrationRequest request =
                                              new RegistrationRequest(
                                                  customer: new Customer(
                                                      email: _email,
                                                      firstname: _fName,
                                                      lastname: _lName),
                                                  password: _password);
                                          final dyn = request.toJson();
                                          print(jsonEncode(dyn));
                                          String bdy = jsonEncode(dyn);
                                          registrationScreenPresenter
                                              .doRegister(bdy);
                                          _scaffoldKey.currentState
                                              .removeCurrentSnackBar();
                                        } else {
                                          CommonUtils.showToast(
                                              msg: "Please select gender",
                                              bgColor: Colors.red);
                                        }
                                      } else
                                        CommonUtils.showSnackbar(
                                            _scaffoldKey,
                                            LoginConstants
                                                .NETWORK_NOT_AVAILABLE);
                                    });
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                textColor: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0,
                                      bottom: 15.0,
                                      left: 30.0,
                                      right: 30.0),
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Catamaran",
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(top: 40.0),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new InkWell(
                                  onTap: () {
                                    // Navigate to Login Screen
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Exsisting User? Login here',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: "Catamaran",
                                        fontWeight: FontWeight.w500,
                                        color: HexColor(txt_color)),
                                    textAlign: TextAlign.right,
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ))),
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
  void onRegisterError(String errorTxt) {
    // TODO: implement onRegisterError
    CommonUtils.dismissDialogProgress(context);
    CommonUtils.showToast(msg: "Server Error", bgColor: Colors.red);
  }

  @override
  void onRegisterSuccess(RegistrationData user) {
    CommonUtils.dismissDialogProgress(context);
    print(user.message);
    if (user.message == "") {
      CommonUtils.showToast(
          msg: "Regitration Successfully", bgColor: Colors.blue);
      Navigator.pop(context);
    } else {
      CommonUtils.showSnackbar(_scaffoldKey, user.message);
    }
  }
}
