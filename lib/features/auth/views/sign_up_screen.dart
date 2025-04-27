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

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final GetColor color = GetColor();
  final GetTextStyle style = GetTextStyle();
  final AuthController auth = Get.find<AuthController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Decoration Container
                authHeaderDecoration(
                  title: "Create Your Account",
                  subTitle: "Create Your NotunBazar Account",
                ),
                getVerticalSpace(28),

                // Sing in title
                SizedBox(width: Get.width),
                Text("Sign Up", style: style.getHeading1()),
                getVerticalSpace(10),

                // Form is used to validate the input fields
                Form(
                  child: Column(
                    spacing: 8.h,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          spacing: 10,
                          children: [
                            CustomInputField(
                              controller: auth.firstNameController,
                              title: "First Name",
                            ),
                            CustomInputField(
                              controller: auth.lastNameController,
                              title: "Last Name",
                            ),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Obx(
                                  () => Checkbox(
                                    value: auth.isTermsAccepted.value,
                                    onChanged: (bool? value) {
                                      auth.isTermsAccepted.value =
                                          value ?? false;
                                    },
                                  ),
                                ),
                                Text(
                                  "Agree to our terms & conditions",
                                  style: style.getBody3(),
                                ),
                              ],
                            ),
                       
                            // sign in button
                            CustomButton(
                              buttonTitle: "Sign Up",
                              onTap: () => auth.signUpMethod(_formKey),
                            ),
                          ],
                        ),
                      ),
                      getVerticalSpace(6),
                      ORDivider(),

                      // Other sing in options
                      getVerticalSpace(6),
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
                            onTap: () => Get.toNamed(Routes.signInScreen),
                            child: Text("Sign In", style: style.getBody3()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),);
  }
}
