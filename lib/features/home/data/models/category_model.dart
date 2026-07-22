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
      id: json['id'],
      name: json['name'],
      image: json['image'],
      isActive: json['is_active'],
      adsCount: json['ads_count'],
    );
  }
}