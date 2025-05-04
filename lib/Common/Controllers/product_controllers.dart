import 'package:flutter_getx_template/Common/models/product_model.dart';
import 'package:get/get.dart';

class ProductControllers extends GetxController {
  // List of best selling products
  RxList<ProductModel> bestSellingProducts = <ProductModel>[
    ProductModel(id: 1, productTitle: "Smart Watch", rating: 3.5, reviewerCount: 120, currentPrice: 100),
    ProductModel(id: 2, productTitle: "Proffesional DSLR Camera", rating: 4.5, reviewerCount: 320, currentPrice: 400, discountedFromPrice: 530),
    ProductModel(id: 3, productTitle: "Compact Travel Camera", rating: 3.5, reviewerCount: 120, currentPrice: 100),
    ProductModel(id: 4, productTitle: "Bluetooth Earbuda", rating: 3.5, reviewerCount: 120, currentPrice: 100),
    ProductModel(id: 5, productTitle: "Gaming Headset", rating: 3.5, reviewerCount: 120, currentPrice: 100),
    ProductModel(id: 6, productTitle: "Caliburn Pod", rating: 3.5, reviewerCount: 120, currentPrice: 100),
    ProductModel(id: 7, productTitle: "Gaming Mouse", rating: 3.5, reviewerCount: 120, currentPrice: 100),
  ].obs;

  // List of hot deals products
  RxList<ProductModel> hotDealsProducts = <ProductModel>[
    ProductModel(id: 8, productTitle: "Wireless Charger", rating: 4.0, reviewerCount: 150, currentPrice: 50),
    ProductModel(id: 9, productTitle: "Noise Cancelling Headphones", rating: 4.8, reviewerCount: 200, currentPrice: 300, discountedFromPrice: 350),
    ProductModel(id: 10, productTitle: "Smartphone Gimbal", rating: 4.2, reviewerCount: 180, currentPrice: 120),
    ProductModel(id: 11, productTitle: "Portable Power Bank", rating: 4.5, reviewerCount: 250, currentPrice: 80),
    ProductModel(id: 12, productTitle: "4K Action Camera", rating: 4.3, reviewerCount: 170, currentPrice: 200),
    ProductModel(id: 13, productTitle: "Smart Home Speaker", rating: 4.6, reviewerCount: 300, currentPrice: 150),
    ProductModel(id: 14, productTitle: "Ergonomic Keyboard", rating: 4.4, reviewerCount: 220, currentPrice: 90),
  ].obs;
  
}