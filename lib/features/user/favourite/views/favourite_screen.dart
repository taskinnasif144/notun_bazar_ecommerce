import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/Controllers/sidebar_controllers.dart';
import 'package:flutter_getx_template/Common/components/custom_appbars.dart';
import 'package:flutter_getx_template/core/wrappers/screen_wrapper.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return screemWrapper(
      scaffoldKey: Get.find<SidebarController>().scaffoldFavouriteKey,
      appbar: customAppBar2(),
      child: Column(),
    );
  }
}
