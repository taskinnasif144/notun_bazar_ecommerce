import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/components/custom_appbars.dart';
import 'package:flutter_getx_template/Common/components/custom_button.dart';
import 'package:flutter_getx_template/Common/components/custom_input_field.dart';
import 'package:flutter_getx_template/Common/components/custom_phone_input.dart';
import 'package:flutter_getx_template/core/utils/spacing.dart';
import 'package:flutter_getx_template/core/wrappers/screen_wrapper.dart';
import 'package:flutter_getx_template/features/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  VerifyEmailScreen({super.key});

  final AuthController auth = Get.find<AuthController>();

  // key to validate forms
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return screenWrapper(
      appbar: customAppBar1(title: "Forget Password"),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          // Title Message
          Center(
            child: Obx(
              () => Text(
                "Please verify with your ${auth.isWithEmail.value ? "E-mail" : "phone"}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),

          // Input field
          getVerticalSpace(20),
          Obx(
            () => Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    child:
                        auth.isWithEmail.value
                            ? CustomInputField(
                              controller: auth.emailController,
                              isEmail: true,
                              hintText: "Verify with Email",
                            )
                            : CustomPhoneInputField(
                              controller: auth.phoneController,
                            ),
                  ),

                  // Continue to Next Page
                  getVerticalSpace(20),
                  CustomButton(buttonTitle: "Next", onTap: () {
                    auth.sendOtp(_formKey);
                  }),
                ],
              ),
            ),
          ),

          // change verification method
          TextButton(
            onPressed: () {
              auth.isWithEmail.value = !auth.isWithEmail.value;
            },
            child: Obx(
              () => Text(
                "Verify with ${auth.isWithEmail.value ? "email" : "phone"}",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
