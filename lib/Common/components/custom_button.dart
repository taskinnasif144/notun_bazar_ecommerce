import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/constants/app_colors.dart';
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



  final LoadingController loader = Get.find<LoadingController>();

  @override
  Widget build(BuildContext context) {
   final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: FractionallySizedBox(
        widthFactor: widthFactor,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            color: (isFilled && !isRed) ? theme.colorScheme.primary : (isFilled && isRed) ? theme.colorScheme.error: null ,
            border: Border.all(
              color: isRed ? theme.colorScheme.error : theme.colorScheme.primary,
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
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color:
                                isFilled
                                    ? Colors.white
                                    : isRed
                                    ? AppColors.dangerColor
                                    : theme.colorScheme.primary,
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