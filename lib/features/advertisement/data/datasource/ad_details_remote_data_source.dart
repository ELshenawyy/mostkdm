import 'package:mostkdm/core/network/api_consumer.dart';
import 'package:mostkdm/core/network/api_endpoints.dart';
import 'package:mostkdm/core/network/dio_consumer.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_details_model.dart';

abstract class AdDetailsRemoteDataSource {
  Future<AdDetailsModel> getAdDetails(String adId);
}

class AdDetailsRemoteDataSourceImpl implements AdDetailsRemoteDataSource {
  final ApiConsumer _api;

  AdDetailsRemoteDataSourceImpl({ApiConsumer? api}) : _api = api ?? DioConsumer();

  @override
  Future<AdDetailsModel> getAdDetails(String adId) async {
    final response = await _api.get(ApiEndpoints.adDetails(adId));
    final data = response['data'];
    return AdDetailsModel.fromJson(data);
  }
}
 