import 'package:dartz/dartz.dart';
import 'package:mostkdm/core/errors/app_exception.dart';
import 'package:mostkdm/features/advertisement/data/datasource/add_ads_remote_data_source.dart';
import 'package:mostkdm/features/advertisement/data/models/add_ad_form_data.dart';
import 'package:mostkdm/features/advertisement/data/models/category_model.dart';
import 'package:mostkdm/features/search/data/models/city_model.dart';

abstract class AddAdRepository {
  Future<Either<AppException, void>> createAd(AddAdFormData data);
  Future<Either<AppException, void>> updateAd(int adId, AddAdFormData data);
  Future<Either<AppException, List<CategoryModel>>> getCategories();
  Future<Either<AppException, List<CategoryModel>>> getSubCategories(
      int categoryId);
  Future<Either<AppException, List<CityModel>>> getCities();
}

class AddAdRepositoryImpl implements AddAdRepository {
  final AddAdRemoteDataSource _remoteDataSource;

  AddAdRepositoryImpl({AddAdRemoteDataSource? remoteDataSource})
      : _remoteDataSource = remoteDataSource ?? AddAdRemoteDataSourceImpl();

  @override
  Future<Either<AppException, void>> createAd(AddAdFormData data) async {
    try {
      await _remoteDataSource.createAd(data);
      return const Right(null);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, void>> updateAd(
    int adId,
    AddAdFormData data,
  ) async {
    try {
      await _remoteDataSource.updateAd(adId, data);
      return const Right(null);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, List<CategoryModel>>> getCategories() async {
    try {
      final categories = await _remoteDataSource.getCategories();
      return Right(categories);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, List<CategoryModel>>> getSubCategories(
    int categoryId,
  ) async {
    try {
      final subCategories =
          await _remoteDataSource.getSubCategories(categoryId);
      return Right(subCategories);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, List<CityModel>>> getCities() async {
    try {
      final cities = await _remoteDataSource.getCities();
      return Right(cities);
    } on AppException catch (e) {
      return Left(e);
    }
  }
}