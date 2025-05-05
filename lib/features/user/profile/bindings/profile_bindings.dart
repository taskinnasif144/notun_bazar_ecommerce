import 'package:flutter_getx_template/features/user/profile/controllers/profile_controllers.dart';
import 'package:get/get.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> ProfileControllers());
  }
}
