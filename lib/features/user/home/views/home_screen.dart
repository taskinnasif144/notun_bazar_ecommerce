import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/Controllers/product_controllers.dart';
import 'package:flutter_getx_template/Common/Controllers/sidebar_controllers.dart';
import 'package:flutter_getx_template/Common/components/carousel_component.dart';
import 'package:flutter_getx_template/Common/components/custom_appbars.dart';
import 'package:flutter_getx_template/Common/components/product_card.dart';
import 'package:flutter_getx_template/core/loggers/debug_logger.dart';
import 'package:flutter_getx_template/core/utils/enums.dart';
import 'package:flutter_getx_template/core/utils/image_renderer.dart';
import 'package:flutter_getx_template/core/wrappers/screen_wrapper.dart';
import 'package:flutter_getx_template/features/user/cart/controllers/cart_controller.dart';
import 'package:flutter_getx_template/features/user/home/bindings/home_binding.dart';
import 'package:flutter_getx_template/features/user/home/views/product_list_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  final HomeController home = Get.find<HomeController>();
  final ProductControllers productController = Get.find<ProductControllers>();
  final CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    printMsg("onPrimary: ${Theme.of(context).colorScheme.onPrimary}");
    return screenWrapper(
      // home scaffold key to open the app drawer from home page
      scaffoldKey: Get.find<SidebarController>().scaffoldHomeKey,
      appbar: customAppBar2(),
      child: SingleChildScrollView(
        child: Column(
          spacing: 20,
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

            // The categories list rendered horizontally
            categoryDivider(context, title: "Shop by Category"),
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

            // renders the products under best selling
            categoryDivider(
              context,
              title: "Best Selling",
              onTap: () {
                   Get.to(() => ProductListScreen(categoryType: SeeAllType.bestSellings, ), binding: HomeBinding());
              },
            ),
            //  Rendering products such that they can be scrolled horizontally
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 16,
                children:
                    productController.bestSellingProducts
                        .take(3)
                        .map(
                          (el) => ProductCard(
                            addToCart: () {
                              cartController.addProductsToCart(el);
                            },
                            model: el,
                          ),
                        )
                        .toList(),
              ),
            ),

            // renders the products under Hot deals
            categoryDivider(
              context,
              title: "Hot Deals",
              onTap: () {
                  Get.to(() => ProductListScreen(categoryType: SeeAllType.hotDeals,), binding: HomeBinding());
              },
            ),
            //  Rendering products such that they can be scrolled horizontally
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 16,
                children:
                    productController.hotDealsProducts
                        .take(3)
                        .map(
                          (el) => ProductCard(
                            addToCart: () {
                              cartController.addProductsToCart(el);
                            },
                            model: el,
                          ),
                        )
                        .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryDivider(
    BuildContext context, {
    required title,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: Row(
        spacing: 12,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          Expanded(
            child: Divider(
              height: 1,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          if (onTap != null)
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  "See All",
                  style: Theme.of(context).textTheme.bodyMedium,
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
