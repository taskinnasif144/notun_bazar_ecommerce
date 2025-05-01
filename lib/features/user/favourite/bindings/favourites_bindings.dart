import 'package:flutter_getx_template/Common/Controllers/sidebar_controllers.dart';
import 'package:get/get.dart';

class FavouritesBindings extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => SidebarController());
  }
}
