import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class IconAlertCounter extends StatelessWidget {
  /*
    The IconAlertCounter class is designed to display a notification count overlay on top of an icon.
    
    This class takes two parameters:
    1. `icon` (Widget): The icon widget to display.
    2. `count` (int): The notification count to be shown.
  */
  
  const IconAlertCounter({
    super.key,
    required this.icon,
    required this.count,
  });

  final Widget icon;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 6.h,horizontal: 6.w),
          child: icon,
        ),
        if(count > 0)
        Positioned(
          top: -5,
          right: 3,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.dangerColor,
              shape: BoxShape.circle
            ),
            child: Text(count.toString(), style: GoogleFonts.roboto(fontSize: 12, color: Colors.white),),
          ),
        )
      ],
    );
  }
}