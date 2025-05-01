import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/Controllers/sidebar_controllers.dart';
import 'package:flutter_getx_template/Common/components/custom_appbars.dart';
import 'package:flutter_getx_template/core/utils/image_renderer.dart';
import 'package:flutter_getx_template/core/wrappers/screen_wrapper.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return screemWrapper(
      // home scaffold key to open the app drawer from home page
      scaffoldKey: Get.find<SidebarController>().scaffoldHomeKey,
      appbar: customAppBar2(),
      child: Column(children: [
        HomeCarousel(),
        
      ]),
    );
  }
}

class HomeCarousel extends StatelessWidget {
  HomeCarousel({super.key});

  final HomeController home = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Below is a package to display carousels
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            viewportFraction: 1,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            onPageChanged: (index, reason) {
              // when a carousel is changed the corresponding index is updated 
              home.selectedCarousel.value = index.toDouble();
            },
          ),
          // renders the carousel items
          items: home.carouselItems
              .map(
                (el) => imageRender(url: el, width: Get.width, height: 200, borderRadius: 12),
              )
              .toList(),
        ),
        // below is the package that visually indicates the position of a carousel
        Obx(()=> DotsIndicator(
          dotsCount: home.carouselItems.length,
          position: home.selectedCarousel.value,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),)
      ],
    );
  }
}
