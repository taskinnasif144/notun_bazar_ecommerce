import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/constants/app_text_style.dart';


class GetTextStyle {
  static final GetTextStyle _instance = GetTextStyle._internal();

  factory GetTextStyle() {
    return _instance;
  }

  GetTextStyle._internal();

  // The header styles getters
  TextStyle getHeading1() {
    return AppTextStyle.headerStyle1;
  }
  TextStyle getHeading2() {
    return AppTextStyle.headerStyle2;
  }

  // The body Styles Getters
  TextStyle getBody1() {
    return AppTextStyle.bodyStyle1;
  }
  TextStyle getBody3() {
    return AppTextStyle.bodyStyle3;
  }

  // And so on...
}
