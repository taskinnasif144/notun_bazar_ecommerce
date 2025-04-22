import 'package:flutter/material.dart';

// This function renders an image based on the provided URL and dimensions.
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
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  } else {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: Image.asset(url, width: width, height: height, fit: BoxFit.cover),
    );
  }
}