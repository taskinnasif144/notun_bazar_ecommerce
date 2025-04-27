import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/utils/get_text_style.dart';
import 'package:get/get.dart';

AppBar customAppBar1({title}) {
  GetTextStyle style = GetTextStyle();
  return AppBar(
        title: Text(title?? "", style: style.getHeading2() ,),
        leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.chevron_left,size: 28,)),
      );
}