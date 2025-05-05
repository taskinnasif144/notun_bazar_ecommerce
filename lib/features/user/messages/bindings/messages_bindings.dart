import 'package:flutter_getx_template/features/user/messages/controllers/messages_controllers.dart';
import 'package:get/get.dart';

class MessagesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessagesControllers(),);
  }
}
