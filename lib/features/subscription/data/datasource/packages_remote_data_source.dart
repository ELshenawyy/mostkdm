import 'package:mostkdm/core/network/api_consumer.dart';
import 'package:mostkdm/core/network/api_endpoints.dart';
import 'package:mostkdm/features/subscription/data/models/packages_model.dart';
import 'package:mostkdm/features/subscription/data/models/subscription_response_model.dart';

abstract class PackagesRemoteDataSource {
  Future<List<PackageModel>> getPackages();
  Future<SubscriptionResponseModel> subscribeToPackage({
    required int packageId,
    required String paymentMethod,
  });
}

class PackagesRemoteDataSourceImpl implements PackagesRemoteDataSource {
  final ApiConsumer _api;

  PackagesRemoteDataSourceImpl(this._api);
  @override
  Future<List<PackageModel>> getPackages() async {
    final response = await _api.get(ApiEndpoints.packages);

    final List<dynamic> packagesList = response['data'] ?? [];

    return packagesList
        .map((e) => PackageModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }


  @override
  Future<SubscriptionResponseModel> subscribeToPackage({
    required int packageId,
    required String paymentMethod,
  }) async {
    final response = await _api.post(
      ApiEndpoints.subscriptions,
      data: {
        'package_id': packageId,
        'payment_method': paymentMethod, 
      },
    );
    return SubscriptionResponseModel.fromJson(response['data']);
  }
}
