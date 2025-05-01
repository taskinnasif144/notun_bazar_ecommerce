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
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
        return child;
          }
          return Center(
        child: CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
          ? loadingProgress.cumulativeBytesLoaded /
              (loadingProgress.expectedTotalBytes ?? 1)
          : null,
        ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Center(
        child: Icon(
          Icons.error,
          color: Colors.red,
          size: width.w * 0.5,
        ),
          );
        },
      ),
    );
  } else {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: Image.asset(url, width: width.w, height: height.h, fit: BoxFit.cover),
    );
  }
}