import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";


/*
The spacing classes here auto makes the size dynamic so do not use const
while using these utility classes
*/

SizedBox getVerticalSpace(double height) {
  return SizedBox(height: height.toDouble().h,);
}

SizedBox getHorizeontalSpace( double width) {
  return SizedBox(width: width.toDouble().w,);
}