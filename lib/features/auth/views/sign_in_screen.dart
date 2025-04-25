import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/components/custom_button.dart';
import 'package:flutter_getx_template/Common/components/custom_input_field.dart';
import 'package:flutter_getx_template/core/routes/app_pages.dart';
import 'package:flutter_getx_template/core/utils/get_color.dart';
import 'package:flutter_getx_template/core/utils/get_text_style.dart';
import 'package:flutter_getx_template/core/utils/spacing.dart';
import 'package:flutter_getx_template/core/wrappers/padding_wrapper.dart';
import 'package:flutter_getx_template/features/auth/controllers/auth_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final GetColor color = GetColor();
  final GetTextStyle style = GetTextStyle();
  final AuthController auth = Get.find<AuthController>();

  final _formKey = GlobalKey<FormState>();

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
              SizedBox(height: 46.h),
              Form(
                child: Column(
                  spacing: 14.h,
                  children: [

                    // Form is used to validate the input fields
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomInputField(
                            controller: auth.emailController,
                            title: "Email",
                          ),
                          CustomInputField(
                            controller: auth.passwordController,
                            title: "Password",
                          ),
                          getVerticalSpace(12),

                          // sign in button
                          CustomButton(
                            buttonTitle: "Sign in",
                            onTap: () => auth.signInMethod(_formKey),
                          ),
                        ],
                      ),
                    ),

                    // to navigate to sign up
                    Row(
                      spacing: 6,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: style.getBody3(),
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.signUpScreen),
                          child: Text("Sign Up", style: style.getBody3()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
