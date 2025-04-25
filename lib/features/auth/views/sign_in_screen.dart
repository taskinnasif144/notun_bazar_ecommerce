import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/components/custom_button.dart';
import 'package:flutter_getx_template/Common/components/custom_input_field.dart';
import 'package:flutter_getx_template/core/utils/get_color.dart';
import 'package:flutter_getx_template/core/utils/get_text_style.dart';
import 'package:flutter_getx_template/core/utils/spacing.dart';
import 'package:flutter_getx_template/core/wrappers/padding_wrapper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final GetColor color = GetColor();
  final GetTextStyle style = GetTextStyle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PaddingWrapper(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: Get.width),
              Text("Sign in", style: style.getHeading1()),
              SizedBox(height: 46.h,),
             Form(
              child: Column(
                spacing: 14.h,
                children: [
                   CustomInputField(controller: TextEditingController(), title: "Email", ),
                   CustomInputField(controller: TextEditingController(), title: "Password", ),
                   getVerticalSpace(12),
                   CustomButton(buttonTitle: "Sign in", onTap: () {})
                ],
              ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
