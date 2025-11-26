class Product {
  final int id;
  final String productName;
  final double price;
  final double previousPrice;
  bool isFavourite;
  final double rating;
  final int totalLikes;
  final String productImage;
  final String productCreatedAt;
  final List<String> displayImages;
  final String description;
  final String deliveryDate;
  final double monthlyPrice;
  final int totalReviews;
  
  Product({
    required this.id,
    required this.productName,
    required this.price,
    required this.previousPrice,
    required this.isFavourite,
    required this.rating,
    required this.totalLikes,
    required this.productImage,
    required this.productCreatedAt,
    required this.displayImages,
    required this.description,
    required this.deliveryDate,
    required this.monthlyPrice,
    required this.totalReviews,
  });
}
