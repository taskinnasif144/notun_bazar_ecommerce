import 'package:flutter_getx_template/Common/Controllers/product_controllers.dart';
import 'package:flutter_getx_template/Common/Controllers/sidebar_controllers.dart';
import 'package:flutter_getx_template/core/themes/app_theme.dart';
import 'package:flutter_getx_template/core/utils/loading_controller.dart';
import 'package:flutter_getx_template/features/user/cart/controllers/cart_controller.dart';
import 'package:flutter_getx_template/features/user/search/controllers/search_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ThemeController>(() => ThemeController());
    Get.lazyPut<SidebarController>(() => SidebarController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<ProductControllers>(() => ProductControllers());
     Get.lazyPut(() => LoadingController());
     Get.lazyPut(() => SearchScreenController());
  }
}
