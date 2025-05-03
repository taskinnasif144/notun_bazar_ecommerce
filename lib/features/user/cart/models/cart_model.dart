class CartModel {
  final int productCount;
  final String productName;
  final String productImageUrl;
  final double productPrice;

  CartModel({
    this.productCount = 1,
    required this.productName,
    required this.productImageUrl,
    required this.productPrice,
  });
}