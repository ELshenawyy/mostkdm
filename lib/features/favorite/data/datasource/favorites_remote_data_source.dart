import 'package:mostkdm/core/network/api_consumer.dart';
import 'package:mostkdm/core/network/api_endpoints.dart';
import 'package:mostkdm/features/favorite/data/model/favorites_response_model.dart';

abstract class FavoritesRemoteDataSource {
  Future<FavoriteToggleResponseModel> toggleFavoriteAd(int adId);
  Future<FavoriteAdsResponseModel> getFavoritesAds();
}

class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  final ApiConsumer _api;

  FavoritesRemoteDataSourceImpl(this._api);

  @override
  Future<FavoriteAdsResponseModel> getFavoritesAds() async {
    final response = await _api.get(ApiEndpoints.getFavorites);

    return FavoriteAdsResponseModel.fromJson(response);
  }

  @override
  Future<FavoriteToggleResponseModel> toggleFavoriteAd(int adId) async {
    final response = await _api.post(
      ApiEndpoints.toggleFavorite,
      data: {
        'ad_id': adId,
      },
    );
    return FavoriteToggleResponseModel.fromJson(response);
  }
}
