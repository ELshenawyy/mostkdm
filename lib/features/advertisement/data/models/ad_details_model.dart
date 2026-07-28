import 'package:mostkdm/features/advertisement/data/models/seller_model.dart';

class AdDetailsModel {
  final String id;
  final String title;
  final String price;
  final String city;
  final int visistedCount;
  final String createdAt;
  final List<String> images;
  final Map<String, String> specifications;
  final SellerModel seller;
  final bool isPremium;
  final bool isFavorite;
  final String description;

  const AdDetailsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.city,
    required this.visistedCount,
    required this.createdAt,
    required this.images,
    required this.specifications,
    required this.seller,
    required this.description,
    this.isPremium = false,
    this.isFavorite = false,
  });

  factory AdDetailsModel.fromJson(Map<String, dynamic> json) {
    final ad = json['ad'] as Map<String, dynamic>? ?? {};
    final userData = json['user_data'] as Map<String, dynamic>?;

    return AdDetailsModel(
      id: ad['id'].toString(),
      title: ad['title'].toString(),
      price: ad['price'].toString(),
      city: (ad['city'] as String?) ?? (ad['location']?.toString() ?? ''),
      visistedCount: ad['visisted_count'] is int
          ? ad['visisted_count']
          : (int.tryParse(ad['visisted_count']?.toString() ?? '') ?? 0),
      createdAt: ad['created_at'].toString(),
      images: (ad['images'] as List).map((e) => e.toString()).toList(),
      specifications: const {},
      seller: userData != null
          ? SellerModel.fromJson(userData)
          : const SellerModel(
              name: '',
              image: '',
              id: 0,
              mobile: "",
              isFollowing: false,
              adsCount: 0,
            ),
      description: ad['description'].toString(),
      isPremium: ad['is_featured'] as bool ? ad['is_featured'] : false,
      isFavorite: ad['is_favourite'] is bool ? ad['is_favourite'] : false,
    );
  }

  int get daysAgo {
    try {
      return DateTime.now().difference(DateTime.parse(createdAt)).inDays;
    } catch (_) {
      return 0;
    }
  }
}
