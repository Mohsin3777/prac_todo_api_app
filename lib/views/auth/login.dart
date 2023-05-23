import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_with_river/controller.dart/auth_controller.dart';
import 'package:todo_with_river/models/user_model.dart';

import '../../models/task_model.dart';

final userRepositaryProvider =
    StateNotifierProvider<UserRepositary, bool>((ref) {
  return UserRepositary(ref: ref);
});

class LoginScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController =
      TextEditingController(text: 'new@g.com');
  final TextEditingController passwordController =
      TextEditingController(text: '123456');

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login(UserModel userModel, BuildContext context) async {
    ref.read(userRepositaryProvider.notifier).login(userModel, context);
  }

//create userRepositary provider

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: emailController,
              ),
              SizedBox(
                height: 20,
              ),
              // Password field
              TextFormField(
                controller: passwordController,
              ),

              SizedBox(
                height: 20,
              ),

              ElevatedButton(
                  onPressed: () {
                    UserModel userModel = UserModel(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        userName: '',
                        id: '');
                    login(userModel, context);
                  },
                  child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
