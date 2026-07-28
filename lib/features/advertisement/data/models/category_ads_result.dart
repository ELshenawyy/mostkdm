import 'package:mostkdm/features/advertisement/data/models/ad_model.dart';
import 'package:mostkdm/features/advertisement/data/models/category_model.dart';

class CategoryAdsResult {
  final String categoryName;
  final List<CategoryModel> subCategories;
  final List<AdModel> ads;

  const CategoryAdsResult({
    required this.categoryName,
    required this.subCategories,
    required this.ads,
  });

  factory CategoryAdsResult.fromJson(Map<String, dynamic> json) {
    final category = json['category'] as Map<String, dynamic>? ?? {};
    final subCategoriesJson =
        category['sub_categories'] as List? ?? [];
    final adsJson = json['ads'] as List? ?? [];

    return CategoryAdsResult(
      categoryName: category['name']?.toString() ?? '',
      subCategories: subCategoriesJson
          .map((e) => CategoryModel.fromJson(e))
          .toList(),
      ads: adsJson.map((e) => AdModel.fromJson(e)).toList(),
    );
  }
}