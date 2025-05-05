import 'package:flutter/cupertino.dart';
import 'package:flutter_getx_template/Common/models/product_model.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  RxList<ProductModel> foundProducts = <ProductModel>[
    ProductModel(
      id: 1,
      productTitle: "Desktop",
      rating: 4.5,
      reviewerCount: 120,
      currentPrice: 500.0,
    ),
    ProductModel(
      id: 2,
      productTitle: "Laptop",
      rating: 4.7,
      reviewerCount: 200,
      currentPrice: 1000.0,
    ),
    ProductModel(
      id: 3,
      productTitle: "Tablet",
      rating: 4.3,
      reviewerCount: 80,
      currentPrice: 300.0,
    ),
    ProductModel(
      id: 4,
      productTitle: "Smartphone",
      rating: 4.8,
      reviewerCount: 500,
      currentPrice: 800.0,
    ),
    ProductModel(
      id: 5,
      productTitle: "Monitor",
      rating: 4.4,
      reviewerCount: 150,
      currentPrice: 200.0,
    ),
    ProductModel(
      id: 6,
      productTitle: "Keyboard",
      rating: 4.6,
      reviewerCount: 90,
      currentPrice: 50.0,
    ),
    ProductModel(
      id: 7,
      productTitle: "Mouse",
      rating: 4.5,
      reviewerCount: 100,
      currentPrice: 30.0,
    ),
    ProductModel(
      id: 8,
      productTitle: "Printer",
      rating: 4.2,
      reviewerCount: 60,
      discountedFromPrice: 180,
      currentPrice: 150.0,
    ),
    ProductModel(
      id: 9,
      productTitle: "Scanner",
      rating: 4.1,
      reviewerCount: 40,
      currentPrice: 120.0,
    ),
    ProductModel(
      id: 10,
      productTitle: "Webcam",
      rating: 4.3,
      reviewerCount: 70,
      discountedFromPrice: 120.55,
      currentPrice: 80.0,
    ),
    ProductModel(
      id: 11,
      productTitle: "Headphones",
      rating: 4.7,
      reviewerCount: 300,
      currentPrice: 100.0,
    ),
    ProductModel(
      id: 12,
      productTitle: "Speakers",
      rating: 4.6,
      reviewerCount: 250,
      currentPrice: 120.0,
    ),
  ].obs;


  Future<List<String>> findSuggestion(String query) async {
    if(query.isEmpty ) {
      return [];
    }
    final suggestionsList = [
      "Desktop",
      "Laptop",
      "Tablet",
      "Smartphone",
      "Monitor",
      "Keyboard",
      "Mouse",
      "Printer",
      "Scanner",
      "Webcam",
      "Headphones",
      "Speakers"
    ];
    return suggestionsList.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
  }
}