import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_with_river/controller.dart/auth_controller.dart';
import 'package:todo_with_river/controller.dart/auth_controller_witnotify.dart';

final auth_notifyProv =
    ChangeNotifierProvider<Auth_Wtih_Notify>((ref) => Auth_Wtih_Notify());

class HomeScreeen extends ConsumerWidget {
  const HomeScreeen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(userModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(data!.email.toString()),
      ),
      body: Center(
        child: Row(
          children: [
            Text(data.password.toString()),
            Text(data.userName.toString()),
          ],
        ),
      ),
    );
  }
}
