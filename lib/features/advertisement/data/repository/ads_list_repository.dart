import 'package:dartz/dartz.dart';
import 'package:mostkdm/core/errors/app_exception.dart';
import 'package:mostkdm/features/advertisement/data/datasource/ads_list_remote_data_source.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_model.dart';

abstract class AdsListRepository {
  Future<Either<AppException, List<AdModel>>> getAllAds();
}

class AdsListRepositoryImpl implements AdsListRepository {
  final AdsListRemoteDataSource _remoteDataSource;

  AdsListRepositoryImpl({AdsListRemoteDataSource? remoteDataSource})
      : _remoteDataSource = remoteDataSource ?? AdsListRemoteDataSourceImpl();

  @override
  Future<Either<AppException, List<AdModel>>> getAllAds() async {
    try {
      final ads = await _remoteDataSource.getAllAds();
      return Right(ads);
    } on AppException catch (e) {
      return Left(e);
    }
  }
}