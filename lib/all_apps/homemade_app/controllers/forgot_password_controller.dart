import 'package:flutter/material.dart';
import 'package:flutteruikit/flutx/flutx.dart';

import '../views/full_app.dart';
import '../views/register_screen.dart';

class ForgotPasswordController extends FxController {
  late TextEditingController emailController = TextEditingController();

  void forgotPassword() {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(builder: (context) => FullApp()),
    );
  }

  void goToRegister() {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }

  @override
  String getTag() {
    return "forgot_password_controller";
  }
}
