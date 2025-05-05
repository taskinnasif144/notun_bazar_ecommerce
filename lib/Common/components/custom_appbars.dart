import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/Controllers/sidebar_controllers.dart';
import 'package:flutter_getx_template/Common/components/custom_input_field.dart';
import 'package:flutter_getx_template/Common/components/icon_alert_counter.dart';
import 'package:flutter_getx_template/core/constants/app_icons.dart';
import 'package:flutter_getx_template/core/constants/image_const.dart';
import 'package:flutter_getx_template/core/routes/app_pages.dart';
import 'package:flutter_getx_template/core/utils/icon_renderer.dart';
import 'package:flutter_getx_template/core/utils/image_renderer.dart';
import 'package:flutter_getx_template/features/user/cart/controllers/cart_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

AppBar customAppBar1({String? title, TextEditingController? controller, bool hasCart = true, Widget? component, bool hasBackButton = true}) {
  return AppBar(
    title:
        controller != null
            ? CustomInputField(controller: controller, height: 8,)
            : component ?? Text(
              title ?? "",
              style: Theme.of(Get.context!).textTheme.bodyLarge,
            ),
    leading: hasBackButton? IconButton(
      onPressed: () => Get.back(),
      icon: Icon(Icons.chevron_left, size: 28),
    ): Center(child: imageRender(url: ImageConst.logo, width: 30, height: 30)),

    actions: [
      if(hasCart)
      Obx(
        () => GestureDetector(
          onTap: () => Get.toNamed(Routes.cartScreen),
          child: IconAlertCounter(
            icon: iconRender(url: AppIcons.cartIcon, size: 18),
            count: Get.find<CartController>().cartProducts.length,
            bottomPadding: 12,
          ),
        ),
      ),
    ],
  );
}
PreferredSize customAppBar2({Widget? component}) {
  return PreferredSize(
    /// The `preferredSize` is used here to define the size of the custom app bar.
    /// It is required because the `AppBar` widget implements the `PreferredSizeWidget` interface,
    preferredSize: Size.fromHeight(80),
    child: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10.w,
              children: [
                // The hamburger icon to open the drawer
                GestureDetector(
                  onTap: () => Get.find<SidebarController>().openDrawer(),
                  child: Icon(Icons.menu),
                ),
                imageRender(url: ImageConst.logo, width: 30, height: 30),
              ],
            ),
            // here the passed custom component will be rendered
            if(component != null)
            Flexible(child: component),
            Row(
              spacing: 6.w,
              children: [
                // Notification Icon button
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.notificationScreen),
                  child: IconAlertCounter(
                    icon: iconRender(url: AppIcons.notificationIcon, size: 18),
                    count: 0,
                  ),
                ),
                // Cart icon button
                Obx(
                  () => GestureDetector(
                    onTap: () => Get.toNamed(Routes.cartScreen),
                    child: IconAlertCounter(
                      icon: iconRender(url: AppIcons.cartIcon, size: 18),
                      count: Get.find<CartController>().cartProducts.length,
                    ),
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

