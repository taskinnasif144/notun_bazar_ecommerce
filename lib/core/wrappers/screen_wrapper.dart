import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({super.key, required this.child, this.appbar});
  final PreferredSizeWidget? appbar;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appbar,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: child,
        ),
      ),
    );
  }
}
