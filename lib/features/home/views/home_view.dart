import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/themes/app_theme.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.homeTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.welcomeMessage,
              style: TextStyle(fontSize: 20.sp),
            ),
            Obx(
              () => Text(
                AppLocalizations.of(
                  context,
                )!.count(controller.count.value.toString()),
                style: TextStyle(fontSize: 24.sp),
              ),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: controller.increment,
              child: Text(AppLocalizations.of(context)!.increment),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () {
                if (Get.locale?.languageCode == 'es') {
                  Get.updateLocale(const Locale('en'));
                } else {
                  Get.updateLocale(const Locale('es'));
                }
              },
              child: Text(AppLocalizations.of(context)!.changeLanguage),
            ),
            SizedBox(height: 20.h),
            // Theme Toggle Dropdown
            Obx(
              () => DropdownButton<String>(
                value: themeController.currentTheme.value,
                items: [
                  DropdownMenuItem(
                    value: 'light',
                    child: Text(AppLocalizations.of(context)!.lightMode),
                  ),
                  DropdownMenuItem(
                    value: 'dark',
                    child: Text(AppLocalizations.of(context)!.darkMode),
                  ),
                  DropdownMenuItem(
                    value: 'eco',
                    child: Text(AppLocalizations.of(context)!.ecomode),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    themeController.switchTheme(value);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
