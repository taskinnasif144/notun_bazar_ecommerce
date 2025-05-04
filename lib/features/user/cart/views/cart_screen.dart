import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/components/custom_appbars.dart';
import 'package:flutter_getx_template/core/constants/app_colors.dart';
import 'package:flutter_getx_template/core/utils/image_renderer.dart';
import 'package:flutter_getx_template/core/wrappers/screen_wrapper.dart';
import 'package:flutter_getx_template/features/user/cart/controllers/cart_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return screemWrapper(
      appbar: customAppBar1(title: "My Cart", hasCart: false),
      child: ListView.builder(
        itemCount: cartController.cartProducts.length,
        itemBuilder: (context, index) {
          final item = cartController.cartProducts[index];
          return Container(
            height: 100,
            width: Get.width,
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 5.h,
            ), //padding inside the cart
            margin: EdgeInsets.symmetric(
              vertical: 5,
            ), // the distance between the items
            // Cart card outer decoraions
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryLight)
            ),
            child: Row(
              spacing: 12,
              children: [
                // The Image of the product
                imageRender(
                  url: item.productImageUrl,
                  width: (80 - 10.h),
                  height: (100 - 10.h),
                  borderRadius: 12,
                ), // image of the product

                SizedBox(
                  width: (Get.width - 40.h - 100 - 10.h) * 0.80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Name of the product
                      Text(
                        item.productName.length > 35? "${item.productName}...": item.productName,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.copyWith(fontSize: 16),
                      ),
                  
                      Row(
                        spacing: 15,
                        children: [
                          // add icon
                          counterAction(context, icon: Icons.add, onTap: () {
                            cartController.updateProductCountBy(index, 1);
                          }),
                          // Product count
                          Obx(
                            () =>  Text(
                            item.productCount.value.toString(),
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                          ),
                          // remove icon
                          counterAction(context, icon: Icons.remove, onTap: () {
                             cartController.updateProductCountBy(index, -1);
                          }),
                  
                          // Product Price
                          Text(
                            "\$${item.productPrice}",
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                // remove from cart button
                IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              ],
            ),
          );
        },
      ),
    );
  }

  GestureDetector counterAction(BuildContext context, {required IconData icon, required VoidCallback onTap}) {
    // This function is responsible for the increase decrease buttons
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.onSecondary,
          size: 18.sp,
        ),
      ),
    );
  }
}
