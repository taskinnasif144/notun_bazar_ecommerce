import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// *** Ensure this import points to the GENERATED file ***
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_storage/get_storage.dart';

import 'core/config/app_constants.dart';
import 'core/routes/app_pages.dart';
import 'core/themes/app_theme.dart';
import 'core/utils/loading_controller.dart'; // Correct import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // To stop orientation change, always fixed to vertical orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // ScreenUtil initialization moved to the builder method
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ThemeController
    Get.put(ThemeController());
    ScreenUtil.init(context); 
  
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        ScreenUtil.init(context);
        return GetMaterialApp(
          title: AppConstants.appName,
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          locale: Get.deviceLocale,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
          builder: (context, widget) {
            return Stack(
              children: [
                widget!,
                GetX<LoadingController>(
                  init: LoadingController(),
                  builder:
                      (controller) =>
                          controller.isLoading.value
                              ? Container(
                                color: Colors.black.withValues(alpha: 0.5),
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                              : const SizedBox.shrink(),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
