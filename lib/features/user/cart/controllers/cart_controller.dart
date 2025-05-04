import 'package:flutter_getx_template/Common/components/custom_snackbar.dart';
import 'package:flutter_getx_template/Common/models/product_model.dart';
import 'package:flutter_getx_template/features/user/cart/models/cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // Holds the products in the cart
  RxList<CartModel> cartProducts = <CartModel>[].obs;

  // Is responsible for operations related to add to cart
  Future addProductsToCart(ProductModel product) async {
    final cart = CartModel(
      productName: product.productTitle,
      productImageUrl: product.imageUrl,
      productPrice: product.currentPrice,
    );
    cartProducts.add(cart);
    showCustomSnackBar("Added to cart");
  }

  // To change the product number in a cart
  Future updateProductCountBy(int index, int updateBY) async {
    // The index parameter refers to the product being modified in the cart.
    // The updateBy parameter specifies the amount by which the product quantity should be adjusted.
    // For example, if the value is 1, the product quantity will increase by 1. If the value is -1, it will decrease by 1.
      if(cartProducts[index].productCount.value + updateBY > 0) {
        cartProducts[index].productCount.value  += updateBY;
        cartProducts[index].totalProductPrice.value = cartProducts[index].productPrice * cartProducts[index].productCount.value ;
      }
     }

  // is responsible for removing the product from the cart
  Future removeFromCart(index) async {
    cartProducts.removeAt(index);
  }
}
