import 'package:flutter_getx_template/Common/models/product_model.dart';
import 'package:get/get.dart';

class ProductControllers extends GetxController {
  // List of best selling products
  RxList<ProductModel> bestSellingProducts = <ProductModel>[
    ProductModel(productTitle: "Smart Watch", rating: 3.5, reviewerCount: 120, currentPrice: 100),
    ProductModel(productTitle: "Proffesional DSLR Camera", rating: 4.5, reviewerCount: 320, currentPrice: 400, discountedFromPrice: 530),
    ProductModel(productTitle: "Compact Travel Camera", rating: 3.5, reviewerCount: 120, currentPrice: 100),
    ProductModel(productTitle: "Bluetooth Earbuda", rating: 3.5, reviewerCount: 120, currentPrice: 100),
    ProductModel(productTitle: "Gaming Headset", rating: 3.5, reviewerCount: 120, currentPrice: 100),
    ProductModel(productTitle: "Caliburn Pod", rating: 3.5, reviewerCount: 120, currentPrice: 100),
    ProductModel(productTitle: "Gaming Mouse", rating: 3.5, reviewerCount: 120, currentPrice: 100),
  ].obs;

  // List of hot deals products
  RxList<ProductModel> hotDealsProducts = <ProductModel>[
    ProductModel(productTitle: "Wireless Charger", rating: 4.0, reviewerCount: 150, currentPrice: 50),
    ProductModel(productTitle: "Noise Cancelling Headphones", rating: 4.8, reviewerCount: 200, currentPrice: 300, discountedFromPrice: 350),
    ProductModel(productTitle: "Smartphone Gimbal", rating: 4.2, reviewerCount: 180, currentPrice: 120),
    ProductModel(productTitle: "Portable Power Bank", rating: 4.5, reviewerCount: 250, currentPrice: 80),
    ProductModel(productTitle: "4K Action Camera", rating: 4.3, reviewerCount: 170, currentPrice: 200),
    ProductModel(productTitle: "Smart Home Speaker", rating: 4.6, reviewerCount: 300, currentPrice: 150),
    ProductModel(productTitle: "Ergonomic Keyboard", rating: 4.4, reviewerCount: 220, currentPrice: 90),
  ].obs;
  
  
}