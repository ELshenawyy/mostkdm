import 'package:mostkdm/core/network/dio_consumer.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_model.dart';
import 'package:mostkdm/features/advertisement/data/models/category_model.dart';
import 'package:mostkdm/features/search/data/models/city_model.dart';
import 'package:mostkdm/features/search/data/models/search_history_item.dart';

import '../../../../../core/network/api_consumer.dart';
import '../../../../../core/network/api_endpoints.dart';

abstract class SearchRemoteDataSource {
  Future<List<AdModel>> search({
    required String keyword,
    int? categoryId,
    int? subCategoryId,
  });
  Future<List<SearchHistoryItem>> getSearchHistory();
  Future<void> deleteSearchHistoryById(int id);
  Future<List<String>> getTopKeywords();

  // ---- Filter ----
  Future<List<CategoryModel>> getCategories();
  Future<List<CategoryModel>> getSubCategories(int categoryId);
  Future<List<CityModel>> getCities();
  Future<List<AdModel>> filterAds({
    int? categoryId,
    int? subCategoryId,
    int? cityId,
    bool? isFeatured,
    double? priceFrom,
    double? priceTo,
  });
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiConsumer api;

  SearchRemoteDataSourceImpl({ApiConsumer? api}) : api = api ?? DioConsumer();

  @override
  Future<List<AdModel>> search({
    required String keyword,
    int? categoryId,
    int? subCategoryId,
  }) async {
    final response = await api.get(
      ApiEndpoints.search,
      queryParameters: {
        'keyword': keyword,
        if (categoryId != null) 'category_id': categoryId,
        if (subCategoryId != null) 'sub_category_id': subCategoryId,
      },
    );

    final List data = response['data']?['results'] ?? [];
    return data.map((e) => AdModel.fromJson(e)).toList();
  }

  @override
  Future<List<SearchHistoryItem>> getSearchHistory() async {
    final response = await api.get(ApiEndpoints.searchHistory);
    final List data = response['data']?['history'] ?? [];
    return data.map((e) => SearchHistoryItem.fromJson(e)).toList();
  }

  @override
  Future<void> deleteSearchHistoryById(int id) async {
    await api.delete(ApiEndpoints.deleteSearchHistoryById(id));
  }

  @override
  Future<List<String>> getTopKeywords() async {
    final response = await api.get(ApiEndpoints.topKeyWords);
    final List data = response['data']?['top_searches'] ?? [];
    return data
        .map((e) => e['keyword']?.toString() ?? '')
        .where((k) => k.isNotEmpty)
        .toList();
  }

  // ---- Filter ----

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await api.get(ApiEndpoints.categories);
    // response.data = { categories: [...] }
    final List data = response['data']?['categories'] ?? [];
    return data.map((e) => CategoryModel.fromJson(e)).toList();
  }

  @override
  Future<List<CategoryModel>> getSubCategories(int categoryId) async {
    final response =
        await api.get(ApiEndpoints.subCategories(categoryId));
    final List data = response['data']?['sub_categories'] ?? [];
    return data.map((e) => CategoryModel.fromJson(e)).toList();
  }

  @override
  Future<List<CityModel>> getCities() async {
    final response = await api.get(ApiEndpoints.cities);
    final List data = response['data'] ?? [];
    return data.map((e) => CityModel.fromJson(e)).toList();
  }

  @override
  Future<List<AdModel>> filterAds({
    int? categoryId,
    int? subCategoryId,
    int? cityId,
    bool? isFeatured,
    double? priceFrom,
    double? priceTo,
  }) async {
    final response = await api.get(
      ApiEndpoints.adsFilter,
      queryParameters: {
        if (categoryId != null) 'category_id': categoryId,
        if (subCategoryId != null) 'sub_category_id': subCategoryId,
        if (cityId != null) 'city_id': cityId,
        if (isFeatured != null) 'is_featured': isFeatured ? 1 : 0,
        if (priceFrom != null) 'price_from': priceFrom,
        if (priceTo != null) 'price_to': priceTo,
      },
    );
    final List data = response['data']?['ads'] ?? [];
    return data.map((e) => AdModel.fromJson(e)).toList();
  }
}