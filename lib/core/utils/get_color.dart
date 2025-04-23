import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/constants/app_colors.dart';


class GetColor {
  // Private static instance
  static final GetColor _instance = GetColor._internal();

  // Factory constructor returns the same instance
  factory GetColor() {
    return _instance;
  }

  // Private named constructor
  GetColor._internal();

  // Your methods

  // Primary color method
  Color getPrimary() {
    return AppColors.primaryColor;
  }

  // Success color method
  Color getSucessColor() {
    return AppColors.sucessColor;
  }

  // Danger color method
  Color getDangerColor() {
    return AppColors.dangerColor;
  }

  // Warning color method
  Color getWarningColor() {
    return AppColors.warningColor;
  }

  Color getTextColor() {
    return AppColors.textColor;
  }
}
