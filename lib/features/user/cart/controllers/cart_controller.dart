import 'package:flutter_getx_template/Common/components/custom_snackbar.dart';
import 'package:flutter_getx_template/Common/models/product_model.dart';
import 'package:flutter_getx_template/features/user/cart/models/cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // Holds the products in the cart
  RxList<CartModel> cartPRoducts = <CartModel>[].obs;

  // Is responsible for operations related to add to cart 
  Future addProductsToCart(ProductModel product) async{
    final cart = CartModel(productName: product.productTitle, productImageUrl: product.imageUrl, productPrice: product.currentPrice);
    cartPRoducts.add(cart);
    showCustomSnackBar("Added to cart");
  }

}
