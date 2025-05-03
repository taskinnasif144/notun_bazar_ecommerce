import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/constants/app_colors.dart';
import 'package:flutter_getx_template/core/constants/app_text_style.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.deepPurple,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,

    // set colors
    colorScheme: const ColorScheme(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondary,
      surface: Colors.white,
      error:  AppColors.dangerColor,
      onPrimary: AppColors.darkGray,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light,
    ),

    // Appbar theme
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.roboto(color: AppColors.darkGray),
      backgroundColor: Colors.white,
    ),

    // Text themes
    textTheme: TextTheme(
      headlineSmall: AppTextStyle.headerTextSmall,
      bodyLarge: AppTextStyle.bodyTextLarge,
      bodyMedium: AppTextStyle.bodyTextMedium,
      bodySmall: AppTextStyle.bodyTextSmall
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.roboto(color: AppColors.darkGray),
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
    ),
  );



  static final ThemeData ecoTheme = ThemeData(
    primarySwatch: Colors.green,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.green[50],



  );
}

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();
  final storage = GetStorage();
  RxString currentTheme = 'light'.obs;

  @override
  void onInit() {
    super.onInit();
    // Load saved theme or default to light
    currentTheme.value = storage.read('theme') ?? 'light';
    applyTheme();
  }

  void switchTheme(String theme) {
    currentTheme.value = theme;
    storage.write('theme', theme); // Persist theme
    applyTheme();
  }

  void applyTheme() {
    switch (currentTheme.value) {
      case 'dark':
        Get.changeTheme(AppTheme.darkTheme);
        break;
      case 'eco':
        Get.changeTheme(AppTheme.ecoTheme);
        break;
      default:
        Get.changeTheme(AppTheme.lightTheme);
    }
  }
}
