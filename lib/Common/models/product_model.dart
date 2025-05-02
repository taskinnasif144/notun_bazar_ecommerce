class ProductModel {
  final String imageUrl;
  final String productTitle;
  final double rating;
  final int reviewerCount;
  final double currentPrice;
  final double? discountedFromPrice;
  ProductModel({
     this.imageUrl = "https://images.unsplash.com/photo-1523275335684-37898b6baf30?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D",
    required this.productTitle,
    required this.rating,
    required this.reviewerCount,
    required this.currentPrice,
    this.discountedFromPrice,
  });
}