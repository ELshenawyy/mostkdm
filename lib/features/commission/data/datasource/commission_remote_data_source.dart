import 'package:mostkdm/core/network/api_consumer.dart';
import 'package:mostkdm/core/network/api_endpoints.dart';
import 'package:mostkdm/features/commission/data/models/commission_calculation_model.dart';
import 'package:mostkdm/features/commission/data/models/pay_commission_response_model.dart';

abstract class CommissionRemoteDataSource {
  Future<PayCommissionResponseModel> payCommission({
    required double price,
    String paymentMethod = 'wallet',
  });
  Future<CommissionCalculationModel> calculateCommission({
    required double price,
  });
}

class CommissionRemoteDataSourceImpl implements CommissionRemoteDataSource {
  final ApiConsumer _api;

  CommissionRemoteDataSourceImpl(this._api);
  @override
  Future<CommissionCalculationModel> calculateCommission(
      {required double price}) async {
    final response = await _api
        .get(ApiEndpoints.calculateCommission, queryParameters: {'price': price});
    return CommissionCalculationModel.fromJson(response['data']);
  }

  @override
  Future<PayCommissionResponseModel> payCommission(
      {required double price, String paymentMethod = 'wallet'}) async {
    final response = await _api.post(ApiEndpoints.payCommission, data: {
      'price': price,
      'payment_method': paymentMethod,
    });
    return PayCommissionResponseModel.fromJson(response['data']);
  }
}
