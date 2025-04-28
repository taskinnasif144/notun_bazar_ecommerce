import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// This function renders an image based on the provided URL and dimensions.
// It automatically adjusts heights and widths based on screen sizes
Widget imageRender({
  required url,
  required double width,
  required double height,
  double? borderRadius,
}) {
  if (url == null || url.isEmpty) {
    return const SizedBox.shrink();
  }
  if (url.startsWith('http')) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: Image.network(
        url,
        width: width.w,
        height: height.h,
        fit: BoxFit.cover,
      ),
    );
  } else {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: Image.asset(url, width: width.w, height: height.h, fit: BoxFit.cover),
    );
  }
}