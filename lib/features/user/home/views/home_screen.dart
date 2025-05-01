import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/Controllers/sidebar_controllers.dart';
import 'package:flutter_getx_template/Common/components/carousel_component.dart';
import 'package:flutter_getx_template/Common/components/custom_appbars.dart';
import 'package:flutter_getx_template/core/utils/image_renderer.dart';
import 'package:flutter_getx_template/core/utils/spacing.dart';
import 'package:flutter_getx_template/core/wrappers/screen_wrapper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  final HomeController home = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return screemWrapper(
      // home scaffold key to open the app drawer from home page
      scaffoldKey: Get.find<SidebarController>().scaffoldHomeKey,
      appbar: customAppBar2(),
      child: Column(
        children: [
          // The carousel component of the home screen
          Obx(
            () => CarouselOptionsComponent(
              images: home.carouselItems,
              selectedIndex: home.selectedCarousel.value,
              onPageChange: (index, reason) {
                home.selectedCarousel.value = index.toDouble();
              },
            ),
          ),
          getVerticalSpace(20),

          // The categories list rendered horizontally
          SizedBox(
            height: 100,
            child: ListView.builder(
              // responsible for horizontal scroll
              scrollDirection: Axis.horizontal,
              itemCount: home.categories.length,
              itemBuilder:
                  (context, index) => ProductCategory(
                    image: home.categories[index].imageUrl,
                    title: home.categories[index].title,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCategory extends StatelessWidget {
  const ProductCategory({super.key, required this.image, required this.title});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    // to access the theme shortcut
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        // TODO: Implement routing
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            imageRender(url: image, width: 60, height: 60),
            Text(title, style: theme.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}


