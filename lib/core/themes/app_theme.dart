import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
    ),
  );

  static final ThemeData ecoTheme = ThemeData(
    primarySwatch: Colors.green,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.green[50],
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
    ),
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