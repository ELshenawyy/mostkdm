class SellerModel {
  final String name;
  final String image;
  final String memberSince;

  const SellerModel({
    required this.name,
    required this.image,
    required this.memberSince,
  });
}

class AdDetailsModel {
  final String title;
  final double price;
  final String city;
  final int views;
  final int daysAgo;
  final List<String> images;
  final Map<String, String> specifications;
  final SellerModel seller;
  final bool isPremium;
  final bool isFavorite;
  final String description;

  const AdDetailsModel({
    required this.title,
    required this.price,
    required this.city,
    required this.views,
    required this.daysAgo,
    required this.images,
    required this.specifications,
    required this.seller,
    required this.description,
    this.isPremium = false,
    this.isFavorite = false,
  });
}