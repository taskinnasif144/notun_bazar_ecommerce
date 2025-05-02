import 'package:flutter_getx_template/Common/components/custom_snackbar.dart';
import 'package:flutter_getx_template/Common/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // Holds the products in the cart
  RxList<ProductModel> cartPRoducts = <ProductModel>[].obs;

  // Is responsible for operations related to add to cart 
  Future addProductsToCart(ProductModel product) async{
    cartPRoducts.add(product);
    showCustomSnackBar("Added to cart");
  }

}
