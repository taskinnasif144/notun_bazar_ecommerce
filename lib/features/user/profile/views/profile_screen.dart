import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/components/custom_appbars.dart';
import 'package:flutter_getx_template/core/constants/app_icons.dart';
import 'package:flutter_getx_template/core/utils/icon_renderer.dart';
import 'package:flutter_getx_template/core/utils/image_renderer.dart';
import 'package:flutter_getx_template/core/utils/spacing.dart';
import 'package:flutter_getx_template/core/wrappers/screen_wrapper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return screenWrapper(
      appbar: customAppBar1(title: "User Profile", hasBackButton: false),
      child: Column(
        children: [
          getVerticalSpace(30),
          //  image
          CircleAvatar(
            radius: 70,
            child: imageRender(
              url: "https://thispersondoesnotexist.com/",
              width: 140,
              height: 140,
              borderRadius: 100,
            ),
          ),

          getVerticalSpace(10),

          //  Name of the user
          Text("Dewan Nasif", style: Theme.of(context).textTheme.bodyLarge),

          getVerticalSpace(2),

          //  address of the user
          Text(
            "Khilgaon Provatibagh",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),

          getVerticalSpace(20),

          // title for account setting
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Account Setting",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),

          getVerticalSpace(16),

          // Setting option: Profile setting
          Column(
            spacing: 12,
            children: [
              accountMenuItem(
                context,
                optionName: "Profile Setting",
                optionSVGIconPath: AppIcons.personOutlinedIcon,
                onTap: () {},
              ),
              accountMenuItem(
                context,
                optionName: "My Orders",
                optionSVGIconPath: AppIcons.shoppingBagIcon,
                onTap: () {},
              ),
              accountMenuItem(
                context,
                optionName: "Transaction History",
                optionSVGIconPath: AppIcons.walletIcon,
                onTap: () {},
              ),
              accountMenuItem(
                context,
                optionName: "Chat & Help",
                optionSVGIconPath: AppIcons.chatOutlinedIcon,
                onTap: () {},
              ),
              accountMenuItem(
                context,
                optionName: "Terms & Conditions",
                optionSVGIconPath: AppIcons.termsConditionIcon,
                onTap: () {},
              ),
              accountMenuItem(
                context,
                optionName: "Logout",
                optionSVGIconPath: AppIcons.logoutIcon,
                isLogout: true,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget accountMenuItem(
    BuildContext context, {
    required VoidCallback onTap,
    required String optionName,
    required String optionSVGIconPath,
    bool isLogout = false
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        spacing: 12,
        children: [
          // icon for the option
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isLogout? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: iconRender(
              url: optionSVGIconPath,
              color: isLogout? Colors.white: Theme.of(context).colorScheme.primary,
            ),
          ),
          // option name
          Text(optionName, style: Theme.of(context).textTheme.bodyMedium),

          Spacer(),

          Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
