import 'category_model.dart';

class AdModel {
  final int id;
  final String title;
  final String cover;
  final String description;
  final String price;
  final bool isActive;
  final String isActiveLabel;
  final int visitedCount;
  final String location;
  final String latitude;
  final String longitude;
  final bool isFavourite;
  final String createdAt;
  final List<String> images;
  final CategoryModel? category;
  final CategoryModel? subCategory;

  const AdModel({
    required this.id,
    required this.title,
    required this.cover,
    required this.description,
    required this.price,
    required this.isActive,
    required this.isActiveLabel,
    required this.visitedCount,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.isFavourite,
    required this.createdAt,
    this.images = const [],
    this.category,
    this.subCategory,
  });

  AdModel copyWith({
    bool? isActive,
    String? isActiveLabel,
  }) {
    return AdModel(
      id: id,
      title: title,
      cover: cover,
      description: description,
      price: price,
      isActive: isActive ?? this.isActive,
      isActiveLabel: isActiveLabel ?? this.isActiveLabel,
      visitedCount: visitedCount,
      location: location,
      latitude: latitude,
      longitude: longitude,
      isFavourite: isFavourite,
      createdAt: createdAt,
      images: images,
      category: category,
      subCategory: subCategory,
    );
  }

  int get daysAgo {
    try {
      return DateTime.now().difference(DateTime.parse(createdAt)).inDays;
    } catch (_) {
      return 0;
    }
  }

  factory AdModel.fromJson(Map<String, dynamic> json) {
    // دالة مساعدة لتحويل أي شكل للـ category لـ CategoryModel بأمان
    CategoryModel? parseCategory(dynamic input) {
      if (input == null) return null;

      if (input is Map<String, dynamic>) {
        return CategoryModel(
          id: input['id'] is int
              ? input['id']
              : (int.tryParse(input['id']?.toString() ?? '') ?? 0),
          name: input['name']?.toString() ?? '',
          image: input['image']?.toString() ?? '',
          isActive: input['is_active'] is bool
              ? input['is_active']
              : (input['is_active'] == 1 || input['is_active'] == '1'),
          adsCount: input['ads_count'] is int
              ? input['ads_count']
              : (int.tryParse(input['ads_count']?.toString() ?? '') ?? 0),
        );
      }

      // لو الـ API راجع String بس (زي الـ Search API)
      if (input is String && input.isNotEmpty) {
        return CategoryModel(
          id: 0,
          name: input,
          image: '',
          isActive: true,
          adsCount: 0,
        );
      }

      return null;
    }

    // دالة مساعدة لمعالجة الـ bool بأمان سواء جاء bool أو 1/0 أو "true"/"false"
    bool parseBool(dynamic value) {
      if (value is bool) return value;
      if (value is int) return value == 1;
      if (value is String) return value == '1' || value.toLowerCase() == 'true';
      return false;
    }

    return AdModel(
      id: json['id'] is int
          ? json['id']
          : (int.tryParse(json['id']?.toString() ?? '') ?? 0),
      title: json['title']?.toString() ?? '',
      cover: json['cover']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      price: json['price']?.toString() ?? '0.00',
      isActive: parseBool(json['is_active']),
      isActiveLabel: json['is_active_label']?.toString() ?? '',
      visitedCount: json['visited_count'] is int
          ? json['visited_count']
          : (int.tryParse(
                  (json['visited_count'] ?? json['visisted_count'])?.toString() ?? '') ??
              0),
      location: json['location']?.toString() ?? '',
      latitude: json['latitude']?.toString() ?? '0',
      longitude: json['longitude']?.toString() ?? '0',
      isFavourite: parseBool(json['is_favourite'] ?? json['is_favorite']),
      createdAt: json['created_at']?.toString() ?? '',
      images: json['images'] is List
          ? (json['images'] as List)
              .map((item) => item?.toString() ?? '')
              .where((item) => item.isNotEmpty)
              .toList()
          : [],
      category: parseCategory(json['category']),
      subCategory: parseCategory(json['sub_category']),
    );
  }
}