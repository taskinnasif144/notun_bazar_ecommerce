import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_template/core/constants/app_colors.dart';
import 'package:flutter_getx_template/core/constants/app_text_style.dart';
import 'package:flutter_getx_template/core/utils/regex_validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomInputField extends StatelessWidget {
  CustomInputField({
    super.key,
    required this.controller,
    this.validator,
    this.isEmail = false,
    this.isPassword = false,
    this.title,
    this.prefixIcon,
    this.maxLines = 1,
    this.hintText,
    this.background,
    this.isNumber = false,
    this.onChanged,
    this.maxLength,
    this.borderRadius,
  });

  final String? title;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final bool isEmail;
  final bool isPassword;
  final String? prefixIcon;
  final int maxLines;
  final TextEditingController controller;
  final Color? background;
  final bool isNumber;
  final Function(String)? onChanged;
  final int? maxLength;
  final double? borderRadius;

  // To track obscure and unobsure state of password text
  final RxBool isObscure = true.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // the title with the sizedbox will only be rendered when it is provided
        if (title != null) Text(title!, style: AppTextStyle.bodyStyle1),
        if (title != null) SizedBox(height: 8.h),
        // To design the text field container is used
        Obx(() {
          final obscure = isObscure.value;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGray),
              borderRadius: BorderRadius.circular(borderRadius?? 12),
              color: background,
            ),
            // Row is used for prefix icons and suffix icons
            child: Row(
              crossAxisAlignment:
                  maxLines == 1
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
              children: [
                if (prefixIcon != null)
                  SvgPicture.asset(prefixIcon!, height: 20.h, width: 20.w),
                if (prefixIcon != null) SizedBox(width: 12.w),
                Flexible(
                  child: TextFormField(
                    onChanged: onChanged,
                    keyboardType: isNumber ? TextInputType.number : null,
                    inputFormatters:
                        isNumber
                            ? [FilteringTextInputFormatter.digitsOnly]
                            : null,
                    controller: controller,
                    // To remove default styling and setting hint text
                    decoration: InputDecoration(
                      hintText: hintText ?? title ?? "",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),

                    obscureText: isPassword ? obscure : false,

                    //  The maxlines determines the number of lines that can occupy the field
                    maxLines: maxLines,
                    // shows 
                    maxLength: maxLength,
                    // This is to validate fields based conditions
                    validator:
                      (value) {
                              if (value == null || value.isEmpty) {
                                // if the value of field is empty
                                return "This field cannot be empty.";
                              }
                              if (isEmail) {
                                if (!RegexValidators.isValidEmail(value) ) {
                                  // if email and not validated then the following the error will be shown
                                  return "Please Enter valid $value.";
                                } 
                              }
                              if (isPassword) {
                                if (!RegexValidators.isValidPassword(value)) {
                                  // password validating on length
                                  return "Must be 8+ chars with upper, lower, number & symbol.";
                                } 
                              }
                              // default return of null
                              return null;
                            },
                  ),
                ),
                // for obscure and unobscure text
                if (isPassword) SizedBox(width: 12.h),
                if (isPassword)
                  Obx(() {
                    return InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        isObscure.value = !isObscure.value;
                      },
                      child: Icon(
                        isObscure.value ? Icons.visibility : Icons.visibility,
                        size: 20,
                      ),
                    );
                  }),
              ],
            ),
          );
        }),
      ],
    );
  }
}