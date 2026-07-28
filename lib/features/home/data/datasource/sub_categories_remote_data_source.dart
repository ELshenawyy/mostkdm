import 'package:mostkdm/core/network/api_consumer.dart';
import 'package:mostkdm/core/network/api_endpoints.dart';
import 'package:mostkdm/core/network/dio_consumer.dart';
import 'package:mostkdm/features/advertisement/data/models/category_ads_result.dart';

abstract class SubCategoryRemoteDataSource {
  Future<CategoryAdsResult> getCategoryAds({
    required int categoryId,
    int? subCategoryId,
  });
}

class SubCategoryRemoteDataSourceImpl implements SubCategoryRemoteDataSource {
  final ApiConsumer _api;

  SubCategoryRemoteDataSourceImpl({ApiConsumer? api})
      : _api = api ?? DioConsumer();

  @override
  Future<CategoryAdsResult> getCategoryAds({
    required int categoryId,
    int? subCategoryId,
  }) async {
    final response = await _api.get(
      ApiEndpoints.categoryAds(categoryId),
      queryParameters: {
        if (subCategoryId != null) 'sub_category_id': subCategoryId,
      },
    );
    return CategoryAdsResult.fromJson(response['data'] as Map<String, dynamic>);
  }
}