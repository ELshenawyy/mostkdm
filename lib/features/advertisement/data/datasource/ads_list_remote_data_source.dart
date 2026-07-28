import 'package:mostkdm/core/network/api_consumer.dart';
import 'package:mostkdm/core/network/api_endpoints.dart';
import 'package:mostkdm/core/network/dio_consumer.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_model.dart';

abstract class AdsListRemoteDataSource {
  Future<List<AdModel>> getAllAds();
}

class AdsListRemoteDataSourceImpl implements AdsListRemoteDataSource {
  final ApiConsumer _api;

  AdsListRemoteDataSourceImpl({ApiConsumer? api}) : _api = api ?? DioConsumer();

  @override
  Future<List<AdModel>> getAllAds() async {
    final response = await _api.get(ApiEndpoints.allAds);
    final List data = response['data']?['ads'] ?? [];
    return data.map((e) => AdModel.fromJson(e)).toList();
  }
}