import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_with_river/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:todo_with_river/services/auth_service.dart';
import 'package:todo_with_river/views/homescreen.dart';

class Auth_Wtih_Notify extends ChangeNotifier {
  UserModel Auth_userModel = UserModel();
  Future signUp(UserModel userModel, BuildContext context) async {
    var data = await AuthService.signUp(context: context, userModel: userModel);

    if (data != null) {
      Auth_userModel = data;
      notifyListeners();
      // ignore: use_build_context_synchronously
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HomeScreeen()));
    }
  }

  Future login(UserModel userModel, BuildContext context) async {
    var data = await AuthService.login(context: context, userModel: userModel);

    if (data['success'] == true) {
      // Auth_userModel = data['data'];
      Auth_userModel = UserModel.fromMap(data['data']);
      // print(Auth_userModel.userName);
      notifyListeners();

      Future.delayed(Duration(seconds: 1), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreeen()));
      });
    }
  }
}
