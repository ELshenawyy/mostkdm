import 'package:mostkdm/features/subscription/data/models/packages_feature_model.dart';

class PackageModel {
  final int id;
  final int type;
  final String typeLabel;
  final String title;
  final String content;
  final int adsCount;
  final int durationValue;
  final String durationUnit;
  final String durationUnitLabel;
  final List<PackageFeatureModel> features;
  final num price;
  final bool isActive;
  final String createdAt;
  final String updatedAt;

  const PackageModel({
    required this.id,
    required this.type,
    required this.typeLabel,
    required this.title,
    required this.content,
    required this.adsCount,
    required this.durationValue,
    required this.durationUnit,
    required this.durationUnitLabel,
    required this.features,
    required this.price,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      id: json['id'] is int
          ? json['id']
          : (int.tryParse(json['id']?.toString() ?? '') ?? 0),
      type: json['type'] is int
          ? json['type']
          : (int.tryParse(json['type']?.toString() ?? '') ?? 0),
      typeLabel: json['type_label']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      content: json['content']?.toString() ?? '',
      adsCount: json['ads_count'] is int
          ? json['ads_count']
          : (int.tryParse(json['ads_count']?.toString() ?? '') ?? 0),
      durationValue: json['duration_value'] is int
          ? json['duration_value']
          : (int.tryParse(json['duration_value']?.toString() ?? '') ?? 0),
      durationUnit: json['duration_unit']?.toString() ?? '',
      durationUnitLabel: json['duration_unit_label']?.toString() ?? '',
      features: json['features'] != null && json['features'] is List
          ? (json['features'] as List)
              .map((x) =>
                  PackageFeatureModel.fromJson(x as Map<String, dynamic>))
              .toList()
          : [],
      price: json['price'] is num
          ? json['price']
          : (num.tryParse(json['price']?.toString() ?? '') ?? 0),
      isActive: json['is_active'] is bool
          ? json['is_active']
          : (json['is_active']?.toString() == 'true' || json['is_active'] == 1),
      createdAt: json['created_at']?.toString() ?? '',
      updatedAt: json['updated_at']?.toString() ?? '',
    );
  }
}
