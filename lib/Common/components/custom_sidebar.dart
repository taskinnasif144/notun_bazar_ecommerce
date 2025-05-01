import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/utils/get_color.dart';
import 'package:flutter_getx_template/core/utils/get_text_style.dart';
import 'package:flutter_getx_template/core/utils/image_renderer.dart';
import 'package:flutter_getx_template/core/utils/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Drawer myDrawer() {
  return Drawer(
    child: Column(
      children: [
        // To display the user information (image and name)
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            border: Border(
              // border bottom to sperate the sections
              bottom: BorderSide(color: GetColor().getPrimary(), width: 1.0),
            ),
          ),
          child: Column(
            spacing: 15.h,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getVerticalSpace(65),
              // user image
              CircleAvatar(
                radius: 60,
                child: imageRender(
                  url: "https://thispersondoesnotexist.com/",
                  width: 120,
                  height: 120,
                  borderRadius: 100,
                ),
              ),
              // user name
              Text("Dewam Nasif", style: GetTextStyle().getHeading2()),
              getHorizeontalSpace(40),
            ],
          ),
        ),
        // Below the sidebar navigations are placed
        Expanded(child: ListView(
          children: [
            ListTile(
              title: Text("Travel", style: GetTextStyle().getBody1(),),
            )
          ],
        ))
      ],
    ),
  );
}
