import 'package:dartz/dartz.dart';
import 'package:mostkdm/core/errors/app_exception.dart';
import 'package:mostkdm/features/favorite/data/datasource/favorites_remote_data_source.dart';
import 'package:mostkdm/features/favorite/data/model/favorites_response_model.dart';

abstract class FavoritesRepository {
  Future<Either<AppException, FavoriteAdsResponseModel>> getFavoritesAds();

  Future<Either<AppException, FavoriteToggleResponseModel>> toggleFavoriteAd(
      int adId);
}

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDataSource _remoteDataSource;

  FavoritesRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<AppException, FavoriteAdsResponseModel>>
      getFavoritesAds() async {
    try {
      final response = await _remoteDataSource.getFavoritesAds();
      return Right(response);
    } catch (e) {
      return Left(AppException(message: e.toString()));
    }
  }

  @override
  Future<Either<AppException, FavoriteToggleResponseModel>> toggleFavoriteAd(
      int adId) async {
    try {
      final response = await _remoteDataSource.toggleFavoriteAd(adId);
      return Right(response);
    } catch (e) {
      return Left(AppException(message: e.toString()));
    }
  }
}
