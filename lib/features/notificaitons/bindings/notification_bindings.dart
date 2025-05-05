import 'package:flutter_getx_template/core/utils/loading_controller.dart';
import 'package:flutter_getx_template/features/notificaitons/controllers/notificaiton_controller.dart';
import 'package:flutter_getx_template/features/user/search/controllers/search_controller.dart';
import 'package:get/get.dart';

class NotificationBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => NotificaitonController(),);
         Get.lazyPut(() => LoadingController());
         Get.lazyPut(() => SearchScreenController());
  }
}