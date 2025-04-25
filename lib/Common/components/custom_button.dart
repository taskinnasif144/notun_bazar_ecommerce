import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/constants/app_colors.dart';
import 'package:flutter_getx_template/core/utils/get_color.dart';
import 'package:flutter_getx_template/core/utils/get_text_style.dart';
import 'package:flutter_getx_template/core/utils/loading_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.buttonTitle,
    required this.onTap,
    this.isRounded = true,
    this.isFilled = true,
    this.isRed = false,
    this.widthFactor = 1,
    this.isActive = true,
    this.isLoading = false,
  });

  final VoidCallback onTap;
  final String buttonTitle;
  final bool isRounded;
  final bool isFilled;
  final bool isRed;
  final double widthFactor;
  final bool isActive;
  final bool isLoading;

  final GetColor color = GetColor();
  final GetTextStyle text = GetTextStyle();

  final LoadingController loader = Get.find<LoadingController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: FractionallySizedBox(
        widthFactor: widthFactor,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            color: (isFilled && !isRed) ? color.getPrimary() : (isFilled && isRed) ? color.getDangerColor(): null ,
            border: Border.all(
              color: isRed ? color.getDangerColor() : color.getPrimary(),
            ),
            borderRadius: BorderRadius.circular(isRounded ? 100 : 12),
          ),
          child:Obx(
            () {
              return Center(
                child:
                    loader.isLoading.value
                        ? LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.white,
                          size: 22,
                        )
                        : Text(
                          buttonTitle,
                          style:text.getBody1().copyWith(
                            color:
                                isFilled
                                    ? Colors.white
                                    : isRed
                                    ? AppColors.dangerColor
                                    : color.getPrimary(),
                          ),
                        ),
              );
            }
          ),
        ),
      ),
    );
  }
}