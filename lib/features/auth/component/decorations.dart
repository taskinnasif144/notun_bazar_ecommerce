import "package:flutter/material.dart";
import "package:flutter_getx_template/core/constants/image_const.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

Container authHeaderDecoration({required String title, required String subTitle}) {
  return Container(
    width: Get.width,
    height: 80.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14.r),
      image: DecorationImage(
        image: AssetImage(ImageConst.vapingImage),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Colors.black.withAlpha((0.3 * 255).toInt()),
          BlendMode.darken,
        ),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           title,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
            ),
          ),
          Text(
           subTitle,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    ),
  );
}
