import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/components/custom_button.dart';
import 'package:flutter_getx_template/Common/components/custom_input_field.dart';
import 'package:flutter_getx_template/core/constants/app_icons.dart';
import 'package:flutter_getx_template/core/constants/image_const.dart';
import 'package:flutter_getx_template/core/routes/app_pages.dart';
import 'package:flutter_getx_template/core/utils/get_color.dart';
import 'package:flutter_getx_template/core/utils/get_text_style.dart';
import 'package:flutter_getx_template/core/utils/icon_renderer.dart';
import 'package:flutter_getx_template/core/utils/spacing.dart';
import 'package:flutter_getx_template/core/wrappers/padding_wrapper.dart';
import 'package:flutter_getx_template/features/auth/component/divider.dart';
import 'package:flutter_getx_template/features/auth/controllers/auth_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
              // Decoration Container
              Container(
                width: Get.width,
                height: 80.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  image: DecorationImage(
                    image: AssetImage(ImageConst.vapingImage),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Create your account", style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18.sp),),
                      Text("Create your NotunBazar account", style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14.sp),)
                    ],
                  ),
                ),
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
                          ),
                          CustomInputField(
                            controller: auth.passwordController,
                            title: "Password",
                          ),

                          // Forget Password option
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap:
                                    () => Get.toNamed(Routes.verifyEmailScreen),
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
                      width: Get.width * 0.6,
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
                          GestureDetector(
                            onTap: auth.amazonSignInMethod,
                            child: iconRender(url: AppIcons.amazonIcon),
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
