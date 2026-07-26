class CategoryModel {
  final int id;
  final String name;
  final String image;
  final bool isActive;
  final int adsCount;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isActive,
    required this.adsCount,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] is int 
          ? json['id'] 
          : (int.tryParse(json['id']?.toString() ?? '') ?? 0),
      name: json['name']?.toString() ?? '',
      image: json['image']?.toString() ?? '',
      isActive: json['is_active'] is bool ? json['is_active'] : false,
      adsCount: json['ads_count'] is int 
          ? json['ads_count'] 
          : (int.tryParse(json['ads_count']?.toString() ?? '') ?? 0),
    );
  }
}