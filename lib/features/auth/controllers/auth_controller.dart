import 'package:flutter/widgets.dart';
import 'package:flutter_getx_template/Common/components/custom_snackbar.dart';
import 'package:flutter_getx_template/core/utils/loading_controller.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
}
