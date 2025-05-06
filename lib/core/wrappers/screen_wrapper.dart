import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/components/custom_sidebar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Scaffold screenWrapper({appbar, required child, scaffoldKey, bool hasPadding = true}) {
  return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appbar,
      key: scaffoldKey,
      drawer: myDrawer(),
      body: SafeArea(
        child: Padding(
          padding: hasPadding? EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h): EdgeInsets.zero,
          child: child,
        ),
      ),
    );
}