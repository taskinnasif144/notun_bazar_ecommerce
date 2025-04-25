import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget iconRender({required String url, double? size, Color? color}) {
  return SvgPicture.asset(
    url,
    height: size != null ? size.h : 24.h,
    width: size != null ? size.w : 24.w,
    color: color,
  );
}