import 'package:mostkdm/features/advertisement/data/models/ad_model.dart';

class FavoriteToggleResponseModel {
  final bool status;
  final String message;
  final bool isFavorite;

  FavoriteToggleResponseModel({
    required this.status,
    required this.message,
    required this.isFavorite,
  });

  factory FavoriteToggleResponseModel.fromJson(Map<String, dynamic> json) {
    return FavoriteToggleResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      isFavorite: json['data']?['is_favorite'] ?? false,
    );
  }
}

class FavoriteAdsResponseModel {
  final bool status;
  final String message;
  final List<AdModel> ads;

  FavoriteAdsResponseModel({
    required this.status,
    required this.message,
    required this.ads,
  });

  factory FavoriteAdsResponseModel.fromJson(Map<String, dynamic> json) {
    final adsList = (json['data']?['ads'] as List<dynamic>?)
            ?.map((e) => AdModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];

    return FavoriteAdsResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      ads: adsList,
    );
  }
}