import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/Controllers/sidebar_controllers.dart';
import 'package:flutter_getx_template/Common/components/custom_appbars.dart';
import 'package:flutter_getx_template/core/wrappers/screen_wrapper.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return screemWrapper(
      scaffoldKey: Get.find<SidebarController>().scaffoldKey,
      appbar: customAppBar2(),
      child: Column());
  }
}
