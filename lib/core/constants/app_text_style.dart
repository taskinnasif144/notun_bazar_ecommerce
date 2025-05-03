import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {

  static TextStyle headerTextSmall = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Color(0xFF222831),
  );
  static TextStyle bodyTextLarge= GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color(0xFF222831),
  );
  
  static TextStyle bodyTextMedium = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xFF222831),
  );

  static TextStyle bodyTextSmall = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.gray,
  );
}