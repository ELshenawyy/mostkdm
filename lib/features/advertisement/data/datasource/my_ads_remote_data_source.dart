import 'package:mostkdm/core/network/api_consumer.dart';
import 'package:mostkdm/core/network/api_endpoints.dart';
import 'package:mostkdm/core/network/dio_consumer.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_model.dart';

abstract class MyAdsRemoteDataSource {
  Future<List<AdModel>> getMyAds();
  Future<void> deleteAd(int adId);
  Future<void> toggleAdActive(int adId);
}

class MyAdsRemoteDataSourceImpl implements MyAdsRemoteDataSource {
  final ApiConsumer _api;
  MyAdsRemoteDataSourceImpl({ApiConsumer? api}) : _api = api ?? DioConsumer();

  @override
  Future<List<AdModel>> getMyAds() async {
    final response = await _api.get(ApiEndpoints.myAds);
    final List data = response['data']?['ads'] ?? [];
    return data.map((e) => AdModel.fromJson(e)).toList();
  }

  @override
  Future<void> toggleAdActive(int adId) async {
    final response = await _api.patch(ApiEndpoints.toggleAdActive(adId));

    return response;
  }

  @override
  Future<void> deleteAd(int adId) async {
    final response = await _api.delete(ApiEndpoints.userAd(adId));
    return response;
  }
}
