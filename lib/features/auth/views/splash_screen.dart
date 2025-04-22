import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/constants/image_const.dart';
import 'package:flutter_getx_template/core/routes/app_pages.dart';
import 'package:flutter_getx_template/core/utils/image_renderer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Get.offAllNamed(Routes.signInScreen);
    },);
    return Scaffold(
      body: Center(
        child: imageRender(url: ImageConst.logo, width: 200.w, height: 200.h),
      ),
    );
  }
}