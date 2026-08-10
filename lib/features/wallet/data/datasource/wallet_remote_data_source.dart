import 'package:mostkdm/core/network/api_consumer.dart';
import 'package:mostkdm/core/network/api_endpoints.dart';
import 'package:mostkdm/features/wallet/data/models/recharge_model.dart';
import 'package:mostkdm/features/wallet/data/models/transaction_model.dart';
import 'package:mostkdm/features/wallet/data/models/wallet_balance_model.dart';

abstract class WalletRemoteDataSource {
  Future<WalletBalanceModel> getWalletBalance();
  Future<List<TransactionModel>> getWalletTransactions();
  Future<RechargeModel> rechargeWallet({required double amount});
}

class WalletRemoteDataSourceImpl implements WalletRemoteDataSource {
  final ApiConsumer _api;

  WalletRemoteDataSourceImpl(this._api);

  @override
  Future<WalletBalanceModel> getWalletBalance() async {
    final response = await _api.get(ApiEndpoints.walletBalance);
    return WalletBalanceModel.fromJson(response['data'] ?? response);
  }

  @override
  Future<List<TransactionModel>> getWalletTransactions() async {
    final response = await _api.get(ApiEndpoints.walletTransactions);
    
    final List listData = response is List 
        ? response 
        : (response['data'] as List? ?? []);

    return listData
        .map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<RechargeModel> rechargeWallet({required double amount}) async {
    final response = await _api.post(
      ApiEndpoints.rechargeWallet,
      data: {'amount': amount},
    );
    return RechargeModel.fromJson(response['data'] ?? response);
  }
}