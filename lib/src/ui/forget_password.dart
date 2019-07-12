import 'package:flutter/material.dart';
import 'package:flutter_idealz/src/api_utils/ApiConfig.dart';
import 'package:flutter_idealz/src/mvp/ForgetContract.dart';
import 'package:flutter_idealz/src/utils/app_constants.dart';
import 'package:flutter_idealz/src/utils/app_utils.dart';
import 'package:flutter_idealz/src/utils/_color.dart';

class ForgetPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ForgotPassword();
}

class ForgotPassword extends State<ForgetPassword> with ForgotContract {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _autoValidate = false;
  String _email;

  ForgotPresenter presenter;
  TextEditingController textEditingController;
  bool _btnEnabled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = new TextEditingController();
    textEditingController.addListener(() {
      if (textEditingController.text.isNotEmpty && Validator.validateEmail(textEditingController.text) == null) {
        setState(() {
          _btnEnabled = true;
        });
      }else{
        setState(() {
          _btnEnabled = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    presenter = new ForgotPresenter(this);
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: new Material(
          child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: new SingleChildScrollView(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: IconButton(
                          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                          onPressed: () => {
                                // Write code of on back button
                                Navigator.pop(context)
                              }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Forgot Password",
                          style: new TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Catamaran"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Enter your registered email address and we will send you a link to reset your password:",
                          style: new TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Catamaran"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: new Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(top: 20.0),
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
                                controller: textEditingController,
                                validator: Validator.validateEmail,
                                onSaved: (String val) {
                                  setState(() {
                                    _email = val;
                                    print(_email);
                                  });
                                },
                                keyboardType: TextInputType.emailAddress,
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
                                      CommonUtils.showDialogProgressWithMessage(
                                          context: context,
                                          msg: "Please wait...");
                                      String url = ApiConfig.forgotPasswordUrl +
                                          "?email=" +
                                          _email +
                                          "&template=email_reset";
                                      print(url);
                                      presenter.doForgotPassword("", url);
                                      _scaffoldKey.currentState
                                          .removeCurrentSnackBar();
                                    } else
                                      CommonUtils.showSnackbar(_scaffoldKey,
                                          LoginConstants.NETWORK_NOT_AVAILABLE);
                                  });
                                } else {
                                  CommonUtils.showSnackbar(_scaffoldKey,
                                      LoginConstants.FILL_VALID_INPUTS);
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              textColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0,
                                    bottom: 15.0,
                                    left: 30.0,
                                    right: 30.0),
                                child: Text(
                                  'Submit',
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
                    )
                  ],
                ),
              )),
        ),
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
  void onForgotError(String errorTxt) {
    CommonUtils.dismissDialogProgress(context);
    CommonUtils.showToast(msg: "Server Error", bgColor: Colors.red);
  }

  @override
  void onForgotSuccess(bool b) {
    CommonUtils.dismissDialogProgress(context);
    if (b) {
      CommonUtils.showSnackbar(_scaffoldKey, "Email Send to your Email id");
      textEditingController.clear();
    } else {
      CommonUtils.showSnackbar(
          _scaffoldKey, "Something went wrong please try again!");
    }
  }
}
