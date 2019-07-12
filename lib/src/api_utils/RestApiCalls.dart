import 'dart:convert';

import 'package:flutter_idealz/src/modals/login_data.dart';
import 'package:flutter_idealz/src/modals/registration_data.dart';

import 'ApiConfig.dart';
import 'NetworkUtil.dart';

class RestApiCalls {
  NetworkUtil netUtil = new NetworkUtil();

  Future<LoginData> login(
    String bdy,
  ) {
    return netUtil
        .postSignApi(ApiConfig.loginUrl, body: bdy)
        .then((dynamic res) {
      print("Response : " + res.toString());
      List<dynamic> list = new List.from(res);
      return new LoginData.fromJson(list[0]);
    });
  }

  Future<RegistrationData> register(
    String bdy,
  ) {
    return netUtil
        .post(url: ApiConfig.registrationUrl, body: bdy)
        .then((dynamic res) {
      print("Response : " + res.toString());
      return new RegistrationData.fromJson(res);
    });
  }

  Future<bool> forgotPassword(String bdy, String url) {
    return netUtil.putApi(url).then((dynamic res) {
      print("Response : " + res.toString());
      return res;
    });
  }

  Future<RegistrationData> getUserData(String token) {
    return netUtil.get(ApiConfig.GET_USER_DATA, token).then((dynamic res) {
      print("Response : " + res.toString());
      return new RegistrationData.fromJson(res);
    });
  }

  Future<bool> logoutUser(String body) {
    return netUtil.post(url : ApiConfig.LOGOUT_USER, body: body).then((dynamic res) {
      print("Response : " + res.toString());
      return res;
    });
  }
}
