import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/constants/app_colors.dart';
import 'package:flutter_getx_template/core/utils/image_renderer.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

const image =
    "https://images.unsplash.com/photo-1523275335684-37898b6baf30?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D";
const tags = ["Photography", "Camera", "DSLR", "Professional", "Gadget"];

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.lightGray),
      ),
      width: 155.w,
      padding: EdgeInsets.all(8),
      child: Column(
        spacing: 10,
        children: [
          // the image of the product
          SizedBox(
            height: 150.h,
            child: imageRender(url: image, width: 150, height: 150),
          ),
          // has the rating and the category
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Category", style: Theme.of(context).textTheme.bodyMedium),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("320", style: Theme.of(context).textTheme.bodySmall),
                  StarRating(
                    rating: 3.5,
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
            "Proffesional DSLR Camera",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
          ),

          // Product tags
          Text(
            tags.join(', '),
            style: Theme.of(context).textTheme.bodySmall,
          ),

          Divider(color: AppColors.lightGray,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // if it has discount then two prices will be displayed
              Column(
                spacing: 2,
                children: [
                  Text("\$89.99", style: Theme.of(context).textTheme.bodyMedium,),
                  Text("\$89.99", style: Theme.of(context).textTheme.bodySmall!.copyWith(decoration: TextDecoration.lineThrough), ),
                ],
              ),
              // for buy now and add to cart button
              Container(
                padding: EdgeInsets.only(left: 5),
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
                    Text("Buy Now", style: Theme.of(context).textTheme.bodySmall,),
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.warningColor),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.add, size: 16,),),
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
