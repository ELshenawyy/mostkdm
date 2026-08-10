import 'package:dartz/dartz.dart';
import 'package:mostkdm/core/errors/app_exception.dart';
import 'package:mostkdm/features/wallet/data/datasource/wallet_remote_data_source.dart';
import 'package:mostkdm/features/wallet/data/models/recharge_model.dart';
import 'package:mostkdm/features/wallet/data/models/transaction_model.dart';
import 'package:mostkdm/features/wallet/data/models/wallet_balance_model.dart';

abstract class WalletRepository {
  Future<Either<AppException, WalletBalanceModel>> getWalletBalance();
  Future<Either<AppException, List<TransactionModel>>> getWalletTransactions();
  Future<Either<AppException, RechargeModel>> rechargeWallet(
      {required double amount});
}

class WalletRepositoryImpl implements WalletRepository {
  final WalletRemoteDataSource _remoteDataSource;

  WalletRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<AppException, WalletBalanceModel>> getWalletBalance() async {
    try {
      final balance = await _remoteDataSource.getWalletBalance();
      return Right(balance);
    } catch (e) {
      return Left(AppException(message: e.toString()));
    }
  }

  @override
  Future<Either<AppException, List<TransactionModel>>> getWalletTransactions() async {
    try {
      final transactions = await _remoteDataSource.getWalletTransactions();
      return Right(transactions);
    } catch (e) {
      return Left(AppException(message: e.toString()));
    }
  }

  @override
  Future<Either<AppException, RechargeModel>> rechargeWallet({required double amount}) async {
    try {
      final recharge = await _remoteDataSource.rechargeWallet(amount: amount);
      return Right(recharge);
    } catch (e) {
      return Left(AppException(message: e.toString()));
    }
  }
}