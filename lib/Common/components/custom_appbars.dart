import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/Controllers/sidebar_controllers.dart';
import 'package:flutter_getx_template/Common/components/icon_alert_counter.dart';
import 'package:flutter_getx_template/core/constants/app_icons.dart';
import 'package:flutter_getx_template/core/constants/image_const.dart';
import 'package:flutter_getx_template/core/routes/app_pages.dart';
import 'package:flutter_getx_template/core/utils/icon_renderer.dart';
import 'package:flutter_getx_template/core/utils/image_renderer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

AppBar customAppBar1({title}) {

  return AppBar(
        title: Text(title?? "", style: Theme.of(Get.context!).textTheme.bodyLarge ,),
        leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.chevron_left,size: 28,)),
      );
}


PreferredSize customAppBar2() {
  return PreferredSize(
    preferredSize: Size.fromHeight(80),
    child: SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Row(
            spacing: 10.w,
             children: [
               GestureDetector(
                onTap: () => Get.find<SidebarController>().openDrawer(),
                child: Icon(Icons.menu)),
               imageRender(url: ImageConst.logo, width: 36, height: 36)
             ],
           ),
           Row(
            spacing: 6.w,
            children: [
              GestureDetector(
                onTap: () => Get.toNamed(Routes.notificationScreen),
                child: IconAlertCounter(
                  icon: iconRender(url: AppIcons.notificationIcon, size: 18),
                  count: 0,
                ),
              ),
              GestureDetector(
                onTap: ()=> Get.toNamed(Routes.cartScreen),
                child: IconAlertCounter(
                  icon: iconRender(url: AppIcons.cartIcon, size: 18),
                  count: 5,
                ),
              ),
            ],
           ),
         ],
        ),
      ),
    ),
  );
}

