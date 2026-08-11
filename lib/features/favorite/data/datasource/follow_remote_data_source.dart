import 'package:mostkdm/core/network/api_consumer.dart';
import 'package:mostkdm/core/network/api_endpoints.dart';
import 'package:mostkdm/features/favorite/data/model/seller_model.dart';

abstract class FollowRemoteDataSource {
  Future<List<SellerModel>> getFollowersList();

  Future<bool> toggleFollowUser(int userId, bool isFollowing);
}

class FollowRemoteDataSourceImpl implements FollowRemoteDataSource {
  final ApiConsumer _api;

  FollowRemoteDataSourceImpl(this._api);

  @override
  Future<List<SellerModel>> getFollowersList() async {
    final response = await _api.get(ApiEndpoints.getFollowingList);

    final data = response['data'] as Map<String, dynamic>? ?? {};
    final usersList = data['users'] as List? ?? [];

    return usersList
        .map((e) => SellerModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<bool> toggleFollowUser(int userId, bool isFollowing) async {
    final String path =
        isFollowing ? ApiEndpoints.unFollowUser : ApiEndpoints.followUser;

    final response = await _api.post(
      path,
      data: {'user_id': userId},
    );

    final data = response['data'] as Map<String, dynamic>? ?? {};
    return data['is_following'] == true;
  }
}
