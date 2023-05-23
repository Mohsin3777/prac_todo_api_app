import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_with_river/controller.dart/auth_controller.dart';
import 'package:todo_with_river/models/user_model.dart';

import '../../controller.dart/auth_controller_witnotify.dart';
import '../../models/task_model.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void singUp(UserModel userModel, BuildContext context) async {
    ref.read(authControllerProvider).login(userModel, context);
  }

//create userRepositary provider
  final authControllerProvider =
      ChangeNotifierProvider<Auth_Wtih_Notify>((ref) => Auth_Wtih_Notify());

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
                        email: 'new@g.com',
                        password: '123456',
                        userName: 'Mohsin',
                        id: '');
                    singUp(userModel, context);
                  },
                  child: Text('SignUp'))
            ],
          ),
        ),
      ),
    );
  }
}
