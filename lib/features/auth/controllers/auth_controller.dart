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

  // ================>>>>>>>>>>>>>>>>>> Sign Up Mehtods <<<<<<<<<<<<<<<<<<<===================

  // Sign in with email and password Function
  Future signInMethod(formKey) async {
    // to trigger the form validation
    if (!formKey.currentState!.validate()) {
      return;
    }

    final body = {
      "email": emailController.text,
      "passwrod": passwordController.text,
    };

    loaderFunciton();

    showCustomSnackBar("Authorized");

    printMsg("body: $body");

    clearControllers();
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
    loaderFunciton();

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
    loaderFunciton();
    Get.toNamed(Routes.verifyOtpScreen);

    clearControllers();
  }

  // Clear Controllers
  void clearControllers() {
    emailController.clear();
    passwordController.clear();
    firstNameController.clear();
    lastNameController.clear();
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
  }

  void loaderFunciton() async {
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
