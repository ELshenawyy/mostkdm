import 'package:dartz/dartz.dart';
import 'package:mostkdm/core/errors/app_exception.dart';
import 'package:mostkdm/features/advertisement/data/datasource/my_ads_remote_data_source.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_model.dart';

abstract class MyAdsRepository {
  Future<Either<AppException, List<AdModel>>> getMyAds();
  Future<Either<AppException, void>> toggleAdActive(int adId);
  Future<Either<AppException, void>> deleteAd(int adId);
}

class MyAdsRepositoryImpl implements MyAdsRepository {
  final MyAdsRemoteDataSource _remoteDataSource;

  MyAdsRepositoryImpl({MyAdsRemoteDataSource? remoteDataSource})
      : _remoteDataSource = remoteDataSource ?? MyAdsRemoteDataSourceImpl();

  @override
  Future<Either<AppException, List<AdModel>>> getMyAds() async {
    try {
      final ads = await _remoteDataSource.getMyAds();
      return Right(ads);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, void>> toggleAdActive(int adId) async {
    try {
      await _remoteDataSource.toggleAdActive(adId);
      return const Right(null);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, void>> deleteAd(int adId) async {
    try {
      await _remoteDataSource.deleteAd(adId);
      return const Right(null);
    } on AppException catch (e) {
      return Left(e);
    }
  }
}
