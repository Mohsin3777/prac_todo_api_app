import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_with_river/models/task_model.dart';
import 'package:todo_with_river/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:todo_with_river/views/homescreen.dart';

import '../views/auth/login.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);
final userModelProvider = StateProvider<UserModel?>((ref) => null); //signup

class UserRepositary extends StateNotifier<bool> {
  final Ref _ref;
  UserRepositary({required Ref ref})
      : _ref = ref,
        super(false);

  Future<UserModel?> login(UserModel userModel, BuildContext context) async {
    const url = "https://adorable-teal-wetsuit.cyclic.app/auth/login";
    return http.post(Uri.parse(url), body: userModel.toMap()).then((value) {
      var decode = jsonDecode(value.body);
      if (decode['success'] == true) {
        _ref.read(userModelProvider.notifier).update((val) {
          val = UserModel.fromMap(decode['data']);
          print(val.email);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreeen()));
          return val;
        });
      }
    }).catchError((err) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(err.toString()),
          );
        },
      );
      print(err.toString());
    });
  }

  Future<UserModel?> signUp(UserModel userModel, BuildContext context) async {
    const url = "https://adorable-teal-wetsuit.cyclic.app/auth/login";
    return http.post(Uri.parse(url), body: userModel.toMap()).then((value) {
      // state = UserModel.fromJson(value.body);
      print(value.body);
    }).catchError((err) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(err.toString()),
          );
        },
      );
      print(err.toString());
    });
  }
}
