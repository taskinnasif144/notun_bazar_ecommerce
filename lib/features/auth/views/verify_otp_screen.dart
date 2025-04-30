import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_template/Common/components/custom_appbars.dart';
import 'package:flutter_getx_template/Common/components/custom_button.dart';
import 'package:flutter_getx_template/core/utils/get_text_style.dart';
import 'package:flutter_getx_template/core/wrappers/screen_wrapper.dart';
import 'package:flutter_getx_template/features/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerifyOtpScreen extends StatelessWidget {
  VerifyOtpScreen({super.key});

  final AuthController auth = Get.find<AuthController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return screemWrapper(
      appbar: customAppBar1(title: "Verify Otp"),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          // tells the user where the otp has been sent to
          Center(
            child: Text(
              "An Otp has been sent to ${auth.isWithEmail.value ? auth.emailController.text : auth.phoneController.text}",
              style: GetTextStyle().getHeading2(),
            ),
          ),

          // Form to validate the otp box
          Form(
         key: _formKey,
            child: Column(
              spacing: 20,
              children: [
                // otp input box
                Pinput(
                  validator: (s) {
                    if(s != null) {
                      return s.length < 3? "Please enter OTP": null;
                    }
                    return null;
                  },
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                 controller: auth.otpController,
                ),

                // verifies the otp
                CustomButton(buttonTitle: "Verify", onTap: (){
                  auth.verifyOtp(_formKey);
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
