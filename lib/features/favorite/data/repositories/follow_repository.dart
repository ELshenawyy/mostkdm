import 'package:dartz/dartz.dart';
import 'package:mostkdm/core/errors/app_exception.dart';
import 'package:mostkdm/features/favorite/data/datasource/follow_remote_data_source.dart';
import 'package:mostkdm/features/favorite/data/model/seller_model.dart';

abstract class FollowRepository {
  Future<Either<AppException, List<SellerModel>>> getFollowersList();

  Future<Either<AppException,bool>> toggleFollowUser(int userId, bool isFollowing);
}

class FollowRepositoryImpl implements FollowRepository {
  final FollowRemoteDataSource followRemoteDataSource;

  FollowRepositoryImpl(this.followRemoteDataSource);

  @override

  Future<Either<AppException, List<SellerModel>>> getFollowersList() async {
    try {
      final response = await followRemoteDataSource.getFollowersList();
      return Right(response);
    } catch (e) {
      return Left(AppException(message: e.toString()));
    }
  }

  @override
  Future<Either<AppException,bool>> toggleFollowUser(int userId, bool isFollowing) async {
    try {
      final response =
          await followRemoteDataSource.toggleFollowUser(userId, isFollowing);
      return Right(response);
    } catch (e) {
      return Left(AppException(message: e.toString()));
    }
  }
}
