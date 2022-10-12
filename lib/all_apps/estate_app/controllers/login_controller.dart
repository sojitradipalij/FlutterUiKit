import 'package:flutter/material.dart';
import 'package:flutteruikit/flutx/flutx.dart';

class EstateLogInController extends FxController {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  @override
  String getTag() {
    return "login_controller";
  }
}
