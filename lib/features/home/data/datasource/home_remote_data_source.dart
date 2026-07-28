import 'package:mostkdm/core/network/api_consumer.dart';
import 'package:mostkdm/core/network/api_endpoints.dart';
import 'package:mostkdm/core/network/dio_consumer.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_model.dart';
import '../models/home_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeModel> getHome();
  Future<List<AdModel>> search({required String keyword});
  Future<List<String>> getSearchHistory();
  Future<void> deleteSearchHistory({required int id});
  Future<List<String>> getTopKeywords();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiConsumer _api;

  HomeRemoteDataSourceImpl({ApiConsumer? api}) : _api = api ?? DioConsumer();

  @override
 Future<HomeModel> getHome() async {
  final response = await _api.get(ApiEndpoints.home);
  final home = HomeModel.fromJson(response);
  print('PARSED sliders: ${home.sliders.length}, featuredAds: ${home.featuredAds.length}');
  return home;
}

  @override
  Future<List<AdModel>> search({required String keyword}) async {
    final response = await _api.get(
      ApiEndpoints.search,
      queryParameters: {'keyword': keyword},
    );
    return (response['data'] as List).map((e) => AdModel.fromJson(e)).toList();
  }

  @override
  Future<List<String>> getSearchHistory() async {
    final response = await _api.get(ApiEndpoints.searchHistory);
    return (response['data'] as List)
        .map((e) => e['keyword'].toString())
        .toList();
  }

  @override
  Future<void> deleteSearchHistory({required int id}) async {
    await _api.delete(ApiEndpoints.deleteSearchHistoryById(id));
  }

  @override
  Future<List<String>> getTopKeywords() async {
    final response = await _api.get(ApiEndpoints.topKeyWords);
    return (response['data'] as List).map((e) => e.toString()).toList();
  }
}
