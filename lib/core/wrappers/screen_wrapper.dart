import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/components/custom_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Scaffold screemWrapper({appbar, required child, scaffoldKey}) {
  return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appbar,
      key: scaffoldKey,
      drawer: myDrawer(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: child,
        ),
      ),
    );
}