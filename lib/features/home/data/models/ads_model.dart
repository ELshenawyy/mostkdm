class AdModel {
  final int id;
  final String title;
  final String cover;
  final String description;
  final String price;
  final bool isActive;
  final int visitedCount;
  final String location;
  final String latitude;
  final String longitude;
  final bool isFavourite;
  final String createdAt;
  final Map<String, dynamic>? category;
  final Map<String, dynamic>? subCategory;

  const AdModel({
    required this.id,
    required this.title,
    required this.cover,
    required this.description,
    required this.price,
    required this.isActive,
    required this.visitedCount,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.isFavourite,
    required this.createdAt,
    this.category,
    this.subCategory,
  });

  factory AdModel.fromJson(Map<String, dynamic> json) {
    return AdModel(
      id: json['id'],
      title: json['title'],
      cover: json['cover'],
      description: json['description'],
      price: json['price'],
      isActive: json['is_active'],
      visitedCount: json['visisted_count'],
      location: json['location'] ?? '',
      latitude: json['latitude'] ?? '0',
      longitude: json['longitude'] ?? '0',
      isFavourite: json['is_favourite'],
      createdAt: json['created_at'],
      category: json['category'],
      subCategory: json['sub_category'],
    );
  }
}