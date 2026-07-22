import 'package:dartz/dartz.dart';
import 'package:mostkdm/core/errors/app_exception.dart';
import 'package:mostkdm/features/home/data/datasource/home_remote_data_source.dart';
import 'package:mostkdm/features/home/data/models/ads_model.dart';
import '../models/home_model.dart';

abstract class HomeRepository {
  Future<Either<AppException, HomeModel>> getHome();
  Future<Either<AppException, List<AdModel>>> search({required String keyword});
  Future<Either<AppException, List<String>>> getSearchHistory();
  Future<Either<AppException, Unit>> deleteSearchHistory({required int id});
  Future<Either<AppException, List<String>>> getTopKeywords();
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _dataSource;

  HomeRepositoryImpl(this._dataSource);

  @override
  Future<Either<AppException, HomeModel>> getHome() async {
    try {
      final result = await _dataSource.getHome();
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, List<AdModel>>> search({
    required String keyword,
  }) async {
    try {
      final result = await _dataSource.search(keyword: keyword);
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, List<String>>> getSearchHistory() async {
    try {
      final result = await _dataSource.getSearchHistory();
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, Unit>> deleteSearchHistory({
    required int id,
  }) async {
    try {
      await _dataSource.deleteSearchHistory(id: id);
      return const Right(unit);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, List<String>>> getTopKeywords() async {
    try {
      final result = await _dataSource.getTopKeywords();
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }
}
