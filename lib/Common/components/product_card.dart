import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/constants/app_colors.dart';
import 'package:flutter_getx_template/Common/models/product_model.dart';
import 'package:flutter_getx_template/core/utils/image_renderer.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const image =
    "";
const tags = ["Photography", "Camera", "DSLR", "Professional", "Gadget"];

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.model, required this.addToCart});

  final ProductModel model;
  final VoidCallback addToCart;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.lightGray),
      ),
      width: 155.w,
      height: 433,
      padding: EdgeInsets.all(8),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // the image of the product
          SizedBox(
            height: 150.h,
            child: imageRender(url: model.imageUrl, width: 150, height: 150),
          ),
          // has the rating and the category
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Category", style: Theme.of(context).textTheme.bodyMedium),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(model.reviewerCount.toString(), style: Theme.of(context).textTheme.bodySmall),
                  StarRating(
                    rating: model.rating,
                    size: 12.sp,
                    allowHalfRating: true,
                    onRatingChanged: (rating) {},
                  ),
                ],
              ),
            ],
          ),

          // product name with bold font
          Text(
          model.productTitle.length > 35 
            ? '${model.productTitle.substring(0, 35)}...' 
            : model.productTitle,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
          ),

          // Product tags
          Text(
            tags.join(', '),
            style: Theme.of(context).textTheme.bodySmall,
          ),

          Spacer(),

          Divider(color: AppColors.lightGray,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // if it has discount then two prices will be displayed
              Column(
                
                spacing: 2,
                children: [
                  Text("\$${model.currentPrice}", style: Theme.of(context).textTheme.bodyMedium,),
                  // if there is a price that has been given discount to, then that will be inside discountedFromPrice variable
                  if(model.discountedFromPrice != null)
                  Text("\$${model.discountedFromPrice}", style: Theme.of(context).textTheme.bodySmall!.copyWith(decoration: TextDecoration.lineThrough), ),
                ],
              ),
              // for buy now and add to cart button
              Container(
                padding: EdgeInsets.only(left: 5),
                height: 38,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: AppColors.lightGray),
                    left: BorderSide(color: AppColors.lightGray),
                    bottom: BorderSide(color: AppColors.lightGray),
                  ),
                  borderRadius: BorderRadius.circular(100)
                ),
                child: Row(
                  spacing: 4,
                  children: [
                    // Buy now takes the user to checkout page
                    Text("Buy Now", style: Theme.of(context).textTheme.bodySmall,),
                    // add to cart simply adds the product to the cart 
                    GestureDetector(
                      onTap: addToCart,
                      child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.warningColor),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add, size: 16,),),
                    ),
                  ],
                ),
              )
            ],
          )
        ],

      ),
    );
  }
}
