import 'package:dartz/dartz.dart';
import 'package:mostkdm/core/errors/app_exception.dart';
import 'package:mostkdm/features/subscription/data/datasource/packages_remote_data_source.dart';
import 'package:mostkdm/features/subscription/data/models/packages_model.dart';
import 'package:mostkdm/features/subscription/data/models/subscription_response_model.dart';

abstract class PackagesRepository {
  Future<Either<AppException, List<PackageModel>>> getPackages();
  Future<Either<AppException, SubscriptionResponseModel>> subscribeToPackage({
    required int packageId,
    required String paymentMethod,
  });
}

class PackagesRepositoryImpl implements PackagesRepository {
  final PackagesRemoteDataSource _packagesRemoteDataSource;

  PackagesRepositoryImpl(this._packagesRemoteDataSource);

  @override
  Future<Either<AppException, List<PackageModel>>> getPackages() async {
    try {
      final result = await _packagesRemoteDataSource.getPackages();
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, SubscriptionResponseModel>> subscribeToPackage({
    required int packageId,
    required String paymentMethod,
  }) async {
    try {
      final result = await _packagesRemoteDataSource.subscribeToPackage(
        packageId: packageId,
        paymentMethod: paymentMethod,
      );
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }
}
