import 'package:mostkdm/core/network/api_consumer.dart';
import 'package:mostkdm/core/network/api_endpoints.dart';
import 'package:mostkdm/core/network/dio_consumer.dart';
import 'package:mostkdm/features/advertisement/data/models/category_model.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<CategoryModel>> getAllCategories();
}

class CategoriesRemoteDataSourceImpl extends CategoriesRemoteDataSource {
  final ApiConsumer _api;

  CategoriesRemoteDataSourceImpl({ApiConsumer? api})
      : _api = api ?? DioConsumer();
  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final response = await _api.get(ApiEndpoints.categories);
    return (response['data']['categories'] as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
  }
}
