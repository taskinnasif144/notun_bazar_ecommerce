import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  Future signInMethod() async {
       final body = {
       "email": emailController.text,
       "passwrod" : passwordController.text,
       };

  }
}
