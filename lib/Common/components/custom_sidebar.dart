import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/utils/image_renderer.dart';
import 'package:flutter_getx_template/core/utils/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Drawer myDrawer() {
    final theme = Theme.of(Get.context!);
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
              bottom: BorderSide(color: theme.colorScheme.primary , width: 1.0),
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
              Text("Dewam Nasif", style:theme.textTheme.bodyLarge),
              getHorizeontalSpace(40),
            ],
          ),
        ),
        // Below the sidebar navigations are placed
        Expanded(child: ListView(
            children: [
            TextButton(
              onPressed: () {},
              child: Text("Travel", style: theme.textTheme.bodyMedium),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Electronics", style: theme.textTheme.bodyMedium),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Fashion & Beauty", style: theme.textTheme.bodyMedium),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Sports & Gym", style: theme.textTheme.bodyMedium),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Kids & Toys", style: theme.textTheme.bodyMedium),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Technology", style: theme.textTheme.bodyMedium),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Gadgets", style: theme.textTheme.bodyMedium),
            ),
          ],
        ))
      ],
    ),
  );
}
