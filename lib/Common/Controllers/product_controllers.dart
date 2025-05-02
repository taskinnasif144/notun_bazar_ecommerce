import 'package:flutter_getx_template/Common/models/product_model.dart';
import 'package:get/get.dart';

class ProductControllers extends GetxController {
  RxList<ProductModel> allProducts = <ProductModel>[
    ProductModel(productTitle: "Smart Watch", rating: 3.5, reviewerCount: 120, currentPrice: 100),
    ProductModel(productTitle: "Proffesional DSLR Camera", rating: 4.5, reviewerCount: 320, currentPrice: 400, discountedFromPrice: 530),
    ProductModel(productTitle: "Compact Travel Camera", rating: 3.5, reviewerCount: 120, currentPrice: 100),
    ProductModel(productTitle: "Bluetooth Earbuda", rating: 3.5, reviewerCount: 120, currentPrice: 100),
    ProductModel(productTitle: "Gaming Headset", rating: 3.5, reviewerCount: 120, currentPrice: 100),
    ProductModel(productTitle: "Caliburn Pod", rating: 3.5, reviewerCount: 120, currentPrice: 100),
    ProductModel(productTitle: "Gaming Mouse", rating: 3.5, reviewerCount: 120, currentPrice: 100),
  ].obs;
}