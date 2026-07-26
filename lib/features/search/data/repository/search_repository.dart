import 'package:dartz/dartz.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_model.dart';
import 'package:mostkdm/features/advertisement/data/models/category_model.dart';
import 'package:mostkdm/features/search/data/datasource/search_remote_data_source.dart';
import 'package:mostkdm/features/search/data/models/city_model.dart';
import 'package:mostkdm/features/search/data/models/search_history_item.dart';
import '../../../../core/errors/app_exception.dart';

abstract class SearchRepository {
  Future<Either<AppException, List<AdModel>>> search({
    required String keyword,
    int? categoryId,
    int? subCategoryId,
  });
  Future<Either<AppException, List<SearchHistoryItem>>> getSearchHistory();
  Future<Either<AppException, void>> deleteSearchHistoryById(int id);
  Future<Either<AppException, List<String>>> getTopKeywords();

  // ---- Filter ----
  Future<Either<AppException, List<CategoryModel>>> getCategories();
  Future<Either<AppException, List<CategoryModel>>> getSubCategories(
      int categoryId);
  Future<Either<AppException, List<CityModel>>> getCities();
  Future<Either<AppException, List<AdModel>>> filterAds({
    int? categoryId,
    int? subCategoryId,
    int? cityId,
    bool? isFeatured,
    double? priceFrom,
    double? priceTo,
  });
}

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remoteDataSource;

  SearchRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<AppException, List<AdModel>>> search({
    required String keyword,
    int? categoryId,
    int? subCategoryId,
  }) async {
    try {
      final result = await remoteDataSource.search(
        keyword: keyword,
        categoryId: categoryId,
        subCategoryId: subCategoryId,
      );
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, List<SearchHistoryItem>>>
      getSearchHistory() async {
    try {
      final result = await remoteDataSource.getSearchHistory();
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, void>> deleteSearchHistoryById(int id) async {
    try {
      final result = await remoteDataSource.deleteSearchHistoryById(id);
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, List<String>>> getTopKeywords() async {
    try {
      final result = await remoteDataSource.getTopKeywords();
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  // ---- Filter ----

  @override
  Future<Either<AppException, List<CategoryModel>>> getCategories() async {
    try {
      final result = await remoteDataSource.getCategories();
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, List<CategoryModel>>> getSubCategories(
    int categoryId,
  ) async {
    try {
      final result = await remoteDataSource.getSubCategories(categoryId);
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, List<CityModel>>> getCities() async {
    try {
      final result = await remoteDataSource.getCities();
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, List<AdModel>>> filterAds({
    int? categoryId,
    int? subCategoryId,
    int? cityId,
    bool? isFeatured,
    double? priceFrom,
    double? priceTo,
  }) async {
    try {
      final result = await remoteDataSource.filterAds(
        categoryId: categoryId,
        subCategoryId: subCategoryId,
        cityId: cityId,
        isFeatured: isFeatured,
        priceFrom: priceFrom,
        priceTo: priceTo,
      );
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }
}