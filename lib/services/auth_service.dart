import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:todo_with_river/models/user_model.dart';

class AuthService {
  static Future signUp(
      {required BuildContext context, required UserModel userModel}) async {
    const url = "https://adorable-teal-wetsuit.cyclic.app/auth/signUp";

    try {
      var response = await http.post(Uri.parse(url), body: userModel.toMap());

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('HEKk'),
            content: Text(e.toString()),
          );
        },
      );
    }
  }

  static Future login(
      {required BuildContext context, required UserModel userModel}) async {
    const url = "https://adorable-teal-wetsuit.cyclic.app/auth/login";

    try {
      var response = await http.post(Uri.parse(url), body: userModel.toMap());

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('HEKk'),
            content: Text(e.toString()),
          );
        },
      );
    }
  }
}
