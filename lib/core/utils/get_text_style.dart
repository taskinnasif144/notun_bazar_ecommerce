import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/constants/app_text_style.dart';


class GetTextStyle {
  static final GetTextStyle _instance = GetTextStyle._internal();

  factory GetTextStyle() {
    return _instance;
  }

  GetTextStyle._internal();

  // You can use some theme mode flag or a controller to return appropriate styles
  TextStyle getHeading1() {
    return AppTextStyle.headerStyle1;
  }
  TextStyle getBody1() {
    return AppTextStyle.bodyStyle1;
  }

  // And so on...
}
