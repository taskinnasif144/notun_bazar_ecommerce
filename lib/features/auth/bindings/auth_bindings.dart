import 'package:flutter_getx_template/core/utils/loading_controller.dart';
import 'package:flutter_getx_template/features/auth/controllers/auth_controller.dart';
import 'package:flutter_getx_template/features/user/cart/controllers/cart_controller.dart';
import 'package:get/get.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => LoadingController());
    Get.lazyPut(() => CartController());
  }
}
