import 'package:get/get.dart';

class CartModel {
  final int cartId;
  final RxInt productCount = 1.obs;
  final RxDouble totalProductPrice = 0.0.obs;
  final String productName;
  final String productImageUrl;
  final double productPrice;

  CartModel({
    required this.cartId,
    required this.productName,
    required this.productImageUrl,
    required this.productPrice,
  });
}