import 'package:flutter/widgets.dart';
import 'package:flutter_getx_template/Common/components/custom_snackbar.dart';
import 'package:flutter_getx_template/core/utils/loading_controller.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  // Rx variables
  RxBool isTermsAccepted = false.obs;

  // Text Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  Future signInMethod(formKey) async {
    // to trigger the form validation
    if (!formKey.currentState!.validate()) {
      return;
    }

    final body = {
      "email": emailController.text,
      "passwrod": passwordController.text,
    };

    Get.find<LoadingController>().showLoading();
    await Future.delayed(Duration(seconds: 2));
    Get.find<LoadingController>().hideLoading();

    showCustomSnackBar("Authorized");

    debugPrint("========>>>>>>>>>> body: $body");
  }
  Future signUpMethod(formKey) async {
    // to trigger the form validation
    if (!formKey.currentState!.validate()) {
      return;
    }

    final body = {
      "email": emailController.text,
      "passwrod": passwordController.text,
    };

    Get.find<LoadingController>().showLoading();
    await Future.delayed(Duration(seconds: 2));
    Get.find<LoadingController>().hideLoading();

    showCustomSnackBar("Account Created");

    debugPrint("========>>>>>>>>>> body: $body");
  }

  Future facebookSignInMethod() async {
    debugPrint("============>>>>>>>>>>> Facebook Sign in");
  }
  Future googleSignInMethod() async {
    debugPrint("============>>>>>>>>>>> Google Sign in");
  }
  Future twitterSignInMethod() async {
    debugPrint("============>>>>>>>>>>> Twitter Sign in");
  }
  Future amazonSignInMethod() async {
    debugPrint("============>>>>>>>>>>> Amazon Sign in");
  }
}
