import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/constants/app_colors.dart';
import 'package:flutter_getx_template/core/utils/image_renderer.dart';
import 'package:get/get.dart';

class CarouselOptionsComponent extends StatelessWidget {
  const CarouselOptionsComponent({
    super.key,
    this.height = 200,
    required this.images,
    required this.onPageChange,
    required this.selectedIndex,
  });

  final double height;
  final List images;
  final double selectedIndex;
  final Function(int, CarouselPageChangedReason) onPageChange;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Below is a package to display carousels
        CarouselSlider(
          options: CarouselOptions(
            height: height,
            viewportFraction: 1,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            onPageChanged: onPageChange,
          ),
          // renders the carousel items
          items:
             images
                  .map(
                    (el) => imageRender(
                      url: el,
                      width: Get.width,
                      height: 200,
                      borderRadius: 12,
                    ),
                  )
                  .toList(),
        ),
        // below is the package that visually indicates the position of a carousel
        Positioned(
          left: 0,
          right: 0,
          bottom: 5,
          child: DotsIndicator(
            dotsCount: images.length,
            position: selectedIndex,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeColor: AppColors.primaryColor,
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}