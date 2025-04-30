import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_getx_template/Common/components/custom_snackbar.dart';
import 'package:flutter_getx_template/core/loggers/debug_logger.dart';
import 'package:flutter_getx_template/core/routes/app_pages.dart';
import 'package:flutter_getx_template/core/utils/loading_controller.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // Rx variables
  RxBool isTermsAccepted = false.obs;
  // the method used for user verification
  final RxBool isWithEmail = false.obs;

  // Text Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // ================>>>>>>>>>>>>>>>>>> Sign Up Mehtods <<<<<<<<<<<<<<<<<<<===================

  // Sign in with email and password Function
  Future signInMethod(formKey) async {
    // to trigger the form validation
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }

    // TODO: Remove the comment on validation

    final body = {
      "email": emailController.text,
      "passwrod": passwordController.text,
    };

    await loaderFunciton();

    showCustomSnackBar("Authorized");

    printMsg("body: $body");

    clearControllers();

    Get.toNamed(Routes.mainUserPage);
  }

  // Sign up with email and password method
  Future signUpMethod(formKey) async {
    // to trigger the form validation
    if (!formKey.currentState!.validate()) {
      return;
    }

    final body = {
      "firstName": firstNameController.text,
      "lastName": lastNameController.text,
      "email": emailController.text,
      "passwrod": passwordController.text,
    };
    await loaderFunciton();

    showCustomSnackBar("Account Created");

    printMsg("body: $body");
    clearControllers();
  }

  // On tap sign in options
  Future facebookSignInMethod() async {
    printMsg("Facebook Sign in");
  }

  Future googleSignInMethod() async {
    printMsg("Google Sign in");
  }

  Future twitterSignInMethod() async {
    printMsg("Twitter Sign in");
  }

  // ================>>>>>>>>>>>>>>>>>> Verification Methods <<<<<<<<<<<<<<<<<<<===================

  // Send the otp to the user
  Future sendOtp(formKey) async {
    // Validate the form
    if (!formKey.currentState!.validate()) {
      return;
    }

    final body =
        isWithEmail.value
            ? {"email": emailController.text}
            : {"phone": phoneController.text};

    if (!isWithEmail.value && phoneController.text.length < 5) {
      showCustomSnackBar("Phone number cannot be empty", isError: true);
      return;
    }

    printMsg("body: $body");
    await loaderFunciton();
    Get.toNamed(Routes.verifyOtpScreen);
  }

  // Verify the otp
  Future verifyOtp(formkey) async {
    if (otpController.text.length < 3) {
      showCustomSnackBar("Please enter OTP", isError: true);
      return;
    }

    final body = {"otp": otpController.text};
    printMsg("Otp: $body");
    await loaderFunciton();
    clearControllers();
    Get.toNamed(Routes.newPasswordScreen);
  }


  // Create new password
  Future updatePassword(formKey) async {
    if(!formKey.currentState!.validate()) {
      return;
    }

    if(passwordController.text != confirmPasswordController.text) {
      showCustomSnackBar("Passwords do not match", isError: true);
      return;
    }

    final body = {
      "password": passwordController.text,
    };

    printMsg("body: $body");
    await loaderFunciton();
    Get.toNamed(Routes.signInScreen);
  }

  // Clear Controllers
  void clearControllers() {
    emailController.clear();
    passwordController.clear();
    firstNameController.clear();
    lastNameController.clear();
    otpController.clear();
    confirmPasswordController.clear();
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    otpController.dispose();
    confirmPasswordController.dispose();
  }

  Future loaderFunciton() async {
    Get.find<LoadingController>().showLoading();
    await Future.delayed(Duration(seconds: 2));
    Get.find<LoadingController>().hideLoading();
  }

  @override
  void onClose() {
    disposeControllers();
    super.onClose();
  }
}
