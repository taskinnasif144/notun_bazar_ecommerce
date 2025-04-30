import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/constants/app_colors.dart';
import 'package:flutter_getx_template/core/constants/app_icons.dart';
import 'package:flutter_getx_template/core/constants/image_const.dart';
import 'package:flutter_getx_template/core/utils/get_text_style.dart';
import 'package:flutter_getx_template/core/utils/icon_renderer.dart';
import 'package:flutter_getx_template/core/utils/image_renderer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar customAppBar1({title}) {
  GetTextStyle style = GetTextStyle();
  return AppBar(
        title: Text(title?? "", style: style.getHeading2() ,),
        leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.chevron_left,size: 28,)),
      );
}


PreferredSize customAppBar2() {
  return PreferredSize(
    preferredSize: Size.fromHeight(80),
    child: SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Row(
            spacing: 6.w,
             children: [
               Icon(Icons.menu),
               imageRender(url: ImageConst.logo, width: 36, height: 36)
             ],
           ),
           Row(
            spacing: 6.w,
            children: [
              IconAlertCounter(
                icon: iconRender(url: AppIcons.notificationIcon, size: 24),
                count: 0,
              ),
              IconAlertCounter(
                icon: iconRender(url: AppIcons.cartIcon, size: 24),
                count: 5,
              ),
            ],
           )
         ],
        ),
      ),
    ),
  );
}

class IconAlertCounter extends StatelessWidget {
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