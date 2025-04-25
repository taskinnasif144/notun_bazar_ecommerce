import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String? message, {bool isError = true}) {
  if (message != null && message.isNotEmpty) {
    
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: isError ? Colors.red.shade400 : Colors.green,
          message: message,
          duration: const Duration(seconds: 3),
          snackStyle: SnackStyle.FLOATING,
          margin: EdgeInsets.all(10.sp),
          borderRadius: 8.r,
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
        ),
      );
    
  }
}