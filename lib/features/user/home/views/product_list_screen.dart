import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/Controllers/product_controllers.dart';
import 'package:flutter_getx_template/Common/components/custom_appbars.dart';
import 'package:flutter_getx_template/Common/components/product_card.dart';
import 'package:flutter_getx_template/core/utils/enums.dart';
import 'package:flutter_getx_template/core/wrappers/screen_wrapper.dart';
import 'package:flutter_getx_template/features/user/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatelessWidget {
 ProductListScreen({super.key, required this.categoryType});
  final SeeAllType categoryType;

  final HomeController homeController = Get.find<HomeController>();
  final ProductControllers productControllers = Get.find<ProductControllers>();

  @override
  Widget build(BuildContext context) {
    homeController.searchController.text = categoryType == SeeAllType.bestSellings? "Best Selling Products": "Hot Deals Products";
    return screemWrapper(
      appbar: customAppBar1(controller: homeController.searchController),
      child: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 8.0, // Spacing between columns
          mainAxisSpacing: 12.0, // Spacing between rows
          childAspectRatio: 0.375, // Aspect ratio of each grid item
        ),
        itemCount: categoryType == SeeAllType.bestSellings?  productControllers.hotDealsProducts.length : productControllers.bestSellingProducts.length  , // Number of items
        itemBuilder: (context, index) {
          final product = categoryType == SeeAllType.bestSellings?  productControllers.hotDealsProducts[index] : productControllers.bestSellingProducts[index] ;
          return  ProductCard(model: product, addToCart: (){});
        },
      ),
    );
  }
}