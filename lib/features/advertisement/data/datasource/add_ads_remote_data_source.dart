import 'package:mostkdm/core/network/api_consumer.dart';
import 'package:mostkdm/core/network/api_endpoints.dart';
import 'package:mostkdm/core/network/dio_consumer.dart';
import 'package:mostkdm/features/advertisement/data/models/add_ad_form_data.dart';
import 'package:mostkdm/features/advertisement/data/models/category_model.dart';
import 'package:mostkdm/features/search/data/models/city_model.dart';

/// وظيفتها: تكلم الـ API بتاعة فيتشر إضافة/تعديل الإعلان بالكامل --
/// بما فيها بيانات القوائم (categories/sub-categories/cities) اللي
/// محتاجة للـ dropdowns. مش بتشارك حاجة مع SearchRemoteDataSource --
/// كل فيتشر معزولة بذاتها بالكامل.
abstract class AddAdRemoteDataSource {
  Future<void> createAd(AddAdFormData data);
  Future<void> updateAd(int adId, AddAdFormData data);

  Future<List<CategoryModel>> getCategories();
  Future<List<CategoryModel>> getSubCategories(int categoryId);
  Future<List<CityModel>> getCities();
}

class AddAdRemoteDataSourceImpl implements AddAdRemoteDataSource {
  final ApiConsumer _api;

  AddAdRemoteDataSourceImpl({ApiConsumer? api}) : _api = api ?? DioConsumer();

  @override
  Future<void> createAd(AddAdFormData data) async {
    await _api.post(ApiEndpoints.createAd, data: await data.toFormData());
  }

  @override
  Future<void> updateAd(int adId, AddAdFormData data) async {
    await _api.put(ApiEndpoints.userAd(adId), data: await data.toFormData());
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _api.get(ApiEndpoints.categories);
    final List data = response['data']?['categories'] ?? [];
    return data.map((e) => CategoryModel.fromJson(e)).toList();
  }

  @override
  Future<List<CategoryModel>> getSubCategories(int categoryId) async {
    final response = await _api.get(ApiEndpoints.subCategories(categoryId));
    final List data = response['data']?['sub_categories'] ?? [];
    return data.map((e) => CategoryModel.fromJson(e)).toList();
  }

  @override
  Future<List<CityModel>> getCities() async {
    final response = await _api.get(ApiEndpoints.cities);
    final List data = response['data'] ?? [];
    return data.map((e) => CityModel.fromJson(e)).toList();
  }
}