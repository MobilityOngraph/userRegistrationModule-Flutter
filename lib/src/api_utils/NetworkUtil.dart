import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NetworkUtil {
  // next three lines makes this class a Singleton
  static NetworkUtil _instance = new NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> fetchPost() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts/1');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return json.decode(response.body);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<dynamic> post({Key key, String url, var body}) async {
    print("Post Url :" +url);
    return await http.post(Uri.encodeFull(url), body: body, headers: {
      "Content-Type": "application/json"
    }).then((http.Response response) {
      //      print(response.body);
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(response.body);
    });
  }

  //

  Future<dynamic> get(String url, String token) {
    return http.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + token
    }).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> postApi(String url, {Map headers, body, encoding}) {
    return http
        .post(url,
            body: body,
            headers: {"Accept": "application/json"},
            encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

//      if (statusCode == 500)
//        return _decoder.convert(response.reasonPhrase);
//      else
      return _decoder.convert(res);
    });
  }

  Future<dynamic> postSignApi(String url, {Map headers, body, encoding}) {
    print(url);
    return http
        .post(url,
            body: body,
            headers: {'Content-type': 'application/json'},
            encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      print("Response: " + res + " Status Code " + statusCode.toString());

      if (statusCode < 200 || statusCode > 400 || json == null) {
        return throw new Exception("401");
      }

      return _decoder.convert(res);
    });
  }

  Future<dynamic> putApi(String url, {Map headers, body, encoding}) {
    return http
        .put(url,
            body: body,
            headers: {"Accept": "application/json"},
            encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      return _decoder.convert(res);
    });
  }

  Future<dynamic> patchApi(String url, {Map headers, body, encoding}) {
    return http
        .patch(url,
            body: body,
            headers: {'Content-type': 'application/json'},
            encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      return _decoder.convert(res);
    });
  }

  Future<dynamic> patchUpdateApi(String url, {Map headers, body, encoding}) {
    return http
        .patch(url,
            body: body,
            headers: {'Content-type': 'application/json'},
            encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      return _decoder.convert(res);
    });
  }
}
