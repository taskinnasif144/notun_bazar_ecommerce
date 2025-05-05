import 'package:flutter_getx_template/Common/Controllers/sidebar_controllers.dart';
import 'package:flutter_getx_template/features/user/search/controllers/search_controller.dart';
import 'package:get/get.dart';

class SearchBindings extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => SidebarController());
    Get.lazyPut(() => SearchScreenController());
  }
}
