// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget iconRender({required String url, double? size, Color? color}) {
  return SvgPicture.asset(
    url,
    height: size != null ? size.h : 18.h,
    width: size != null ? size.w : 18.w,
    color: color,
  );
}