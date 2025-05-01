import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {

  static TextStyle headerTextSmall = GoogleFonts.roboto(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: Color(0xFF222222),
  );
  static TextStyle bodyTextLarge= GoogleFonts.roboto(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: Color(0xFF222222),
  );
  
  static TextStyle bodyTextMedium = GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFF222222),
  );

  static TextStyle bodyTextSmall = GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.gray,
  );
}