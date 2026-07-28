import 'package:dartz/dartz.dart';
import 'package:mostkdm/core/errors/app_exception.dart';
import 'package:mostkdm/features/advertisement/data/datasource/ad_details_remote_data_source.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_details_model.dart';

abstract class AdDetailsRepository {
  Future<Either<AppException, AdDetailsModel>> getAdDetails(String adId);
}

class AdDetailsRepositoryImpl implements AdDetailsRepository {
  final AdDetailsRemoteDataSource _dataSource;
  AdDetailsRepositoryImpl(this._dataSource);
  @override
  Future<Either<AppException, AdDetailsModel>> getAdDetails(String adId) async {
    try {
      final result = await _dataSource.getAdDetails(adId);
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }
}
