import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/components/custom_appbars.dart';
import 'package:flutter_getx_template/core/wrappers/screen_wrapper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return screenWrapper(
      appbar: customAppBar1(title: "User Profile", hasBackButton: false),
      child: Column()
    );
  }
}
