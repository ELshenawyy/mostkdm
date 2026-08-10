import 'package:dartz/dartz.dart';
import 'package:mostkdm/core/errors/app_exception.dart';
import 'package:mostkdm/features/commission/data/datasource/commission_remote_data_source.dart';
import 'package:mostkdm/features/commission/data/models/commission_calculation_model.dart';
import 'package:mostkdm/features/commission/data/models/pay_commission_response_model.dart';

abstract class CommissionRepository {
  Future<Either<AppException, CommissionCalculationModel>> calculateCommission({
    required double price,
  });

  Future<Either<AppException, PayCommissionResponseModel>> payCommission(
      {required double price, String paymentMethod = 'wallet'});
}

class CommissionRepositoryImpl extends CommissionRepository {
  final CommissionRemoteDataSource remoteDataSource;

  CommissionRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppException, CommissionCalculationModel>> calculateCommission(
      {required double price}) async {
    try {
      final commission =
          await remoteDataSource.calculateCommission(price: price);
      return Right(commission);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, PayCommissionResponseModel>> payCommission(
      {required double price, String paymentMethod = 'wallet'}) async {
    try {
      final commission = await remoteDataSource.payCommission(
          price: price, paymentMethod: paymentMethod);
      return Right(commission);
    } on AppException catch (e) {
      return Left(e);
    }
  }
}
