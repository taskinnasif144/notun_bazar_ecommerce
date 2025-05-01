import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/constants/app_colors.dart';
import 'package:flutter_getx_template/core/utils/image_renderer.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const image =
    "https://images.unsplash.com/photo-1523275335684-37898b6baf30?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D";

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
      padding: EdgeInsets.all(5),
      child: Column(
        spacing: 10,
        children: [
          // the image of the product
          SizedBox(
            height: 180.h,
            child: imageRender(url: image, width: 150, height: 180),
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
          
        ],
      ),
    );
  }
}
