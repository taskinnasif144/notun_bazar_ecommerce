import 'package:flutter_getx_template/features/notificaitons/controllers/notificaiton_controller.dart';
import 'package:get/get.dart';

class NotificationBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => NotificaitonController(),);
  }
}