import 'package:flutter/material.dart';
import 'package:flutteruikit/flutx/flutx.dart';

class EstateForgotPasswordController extends FxController {
  late TextEditingController emailController = TextEditingController();

  @override
  String getTag() {
    return "forgot_password_controller";
  }
}
