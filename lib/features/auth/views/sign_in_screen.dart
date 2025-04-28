import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/components/custom_button.dart';
import 'package:flutter_getx_template/Common/components/custom_input_field.dart';
import 'package:flutter_getx_template/core/constants/app_icons.dart';
import 'package:flutter_getx_template/core/routes/app_pages.dart';
import 'package:flutter_getx_template/core/utils/get_color.dart';
import 'package:flutter_getx_template/core/utils/get_text_style.dart';
import 'package:flutter_getx_template/core/utils/icon_renderer.dart';
import 'package:flutter_getx_template/core/utils/spacing.dart';
import 'package:flutter_getx_template/core/wrappers/screen_wrapper.dart';
import 'package:flutter_getx_template/features/auth/component/decorations.dart';
import 'package:flutter_getx_template/features/auth/component/divider.dart';
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
    return ScreenWrapper(
      child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Decoration Container
              authHeaderDecoration(
                title: "Sign in to Your Account",
                subTitle: "Sign in to Your NotunBazar Account",
              ),
              getVerticalSpace(50),

              // Sing in title
              SizedBox(width: Get.width),
              Text("Sign in", style: style.getHeading1()),
              SizedBox(height: 46.h),

              // Form is used to validate the input fields
              Form(
                child: Column(
                  spacing: 14.h,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        spacing: 14,
                        children: [
                          CustomInputField(
                            controller: auth.emailController,
                            title: "Email",
                            isEmail: true,
                          ),
                          CustomInputField(
                            controller: auth.passwordController,
                            title: "Password",
                            isPassword: true,
                          ),

                          // Forget Password option
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap:
                                    () {
                                      auth.clearControllers();
                                      Get.toNamed(Routes.verifyEmailScreen);
                                    },
                                child: Text(
                                  "Forgot Password",
                                  style: style.getBody3(),
                                ),
                              ),
                            ],
                          ),
                          getVerticalSpace(8),
                          // sign in button
                          CustomButton(
                            buttonTitle: "Sign in",
                            onTap: () => auth.signInMethod(_formKey),
                          ),
                        ],
                      ),
                    ),
                    getVerticalSpace(10),
                    ORDivider(),

                    // Other sing in options
                    getVerticalSpace(10),
                    SizedBox(
                      width: Get.width * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: auth.facebookSignInMethod,
                            child: iconRender(url: AppIcons.facebookIcon),
                          ),
                          GestureDetector(
                            onTap: auth.googleSignInMethod,
                            child: iconRender(url: AppIcons.googleIcon),
                          ),
                          GestureDetector(
                            onTap: auth.twitterSignInMethod,
                            child: iconRender(url: AppIcons.twitterIcon),
                          ),
                        ],
                      ),
                    ),
                    getVerticalSpace(10),

                    // to navigate to sign up
                    Row(
                      spacing: 6,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?", style: style.getBody3()),
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
      
      );
  }
}
