import 'package:mostkdm/features/home/data/models/ads_model.dart';
import 'package:mostkdm/features/home/data/models/category_model.dart';
import 'package:mostkdm/features/home/data/models/slider_model.dart';

class HomeModel {
  final List<SliderModel> sliders;
  final List<CategoryModel> categories;
  final List<AdModel> featuredAds;

  const HomeModel({
    required this.sliders,
    required this.categories,
    required this.featuredAds,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return HomeModel(
      sliders: (data['sliders'] as List)
          .map((e) => SliderModel.fromJson(e))
          .toList(),
      categories: (data['categories'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList(),
      featuredAds: (data['featured_ads'] as List)
          .map((e) => AdModel.fromJson(e))
          .toList(),
    );
  }
}