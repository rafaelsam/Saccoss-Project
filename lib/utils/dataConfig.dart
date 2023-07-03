import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  static final Future<SharedPreferences> prf = SharedPreferences.getInstance();
// get all users of the application
  static Future<String> authenticateUser(
      {required BuildContext context,
      required String username,
      required String password}) async {
    String message = "";

    final data = {
      "username": username,
      "password": password,
    };

    try {
      final response = await http.post(
        Uri.parse("https://saccosweb.herokuapp.com/login/"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(data),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        // instance preference
        var success = json.decode(response.body)["success"];

        SharedPreferences pref = await prf;

        pref.setString("success_response", success);
        pref.setString("username", username);
      } else {
        final Future<SharedPreferences> prf = SharedPreferences.getInstance();
        SharedPreferences _pref = await prf;
        var error = json.decode(response.body)["non_field_errors"][0];
        await _pref.setString('error', error);
        if (kDebugMode) {
          print("There is an Error: $error");
        }
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("There is an Error: $e");
      }
    }
    return message;
  }

  static Future<String> registerNewUser({
    required BuildContext context,
    required String username,
    required String password,
    required String password2,
    required String email,
    required String first_name,
    required String last_name,
  }) async {
    final data = {
      "username": username,
      "password": password,
      "password2": password2,
      "email": email,
      "first_name": first_name,
      "last_name": last_name
    };

    final response = await http.post(
      Uri.parse("https://saccosweb.herokuapp.com/register/"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 202) {
      var success = response.body;
      final Future<SharedPreferences> prf = SharedPreferences.getInstance();
      SharedPreferences pref = await prf;
      pref.setString("success", success);
      if (kDebugMode) {
        print(response.body);
      }
    } else {
      final Future<SharedPreferences> prf = SharedPreferences.getInstance();
      var errorBody = response.body;
      SharedPreferences pref = await prf;
      pref.setString("error", errorBody);
      if (kDebugMode) {
        print(response.body);
      }
    }
    return response.body;
  }
}
