import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/components/custom_appbars.dart';
import 'package:flutter_getx_template/Common/components/custom_button.dart';
import 'package:flutter_getx_template/Common/components/custom_input_field.dart';
import 'package:flutter_getx_template/core/utils/get_text_style.dart';
import 'package:flutter_getx_template/core/utils/spacing.dart';
import 'package:flutter_getx_template/core/wrappers/screen_wrapper.dart';
import 'package:flutter_getx_template/features/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key});

  final GetTextStyle style = GetTextStyle();
  final AuthController auth = Get.find<AuthController>();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appbar: customAppBar1(title: "New Passsword"),
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Page title and subtitle
          Text("Create New Password", style: style.getHeading2()),
          Text(
            "Create a strong password to secure your account",
            style: style.getBody1(),
          ),

          //  Form to validate fields
          getVerticalSpace(20),
          Form(
            key: _formkey,
            child: Column(
              spacing: 20,
              children: [
                // Password fields
                CustomInputField(
                  controller: auth.passwordController,
                  isPassword: true,
                  title: "New Password",
                ),
                CustomInputField(
                  controller: auth.confirmPasswordController,
                  isPassword: true,
                  title: "Confirm New Password",
                ),
              ],
            ),
          ),

          getVerticalSpace(20),
          CustomButton(
            buttonTitle: "Change Password",
            onTap: () {
              auth.updatePassword(_formkey);
            },
          ),
        ],
      ),
    );
  }
}
