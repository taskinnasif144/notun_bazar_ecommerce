import 'package:flutter_getx_template/features/user/cart/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> CartController());

  }
}
