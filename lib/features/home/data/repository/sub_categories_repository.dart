import 'package:dartz/dartz.dart';
import 'package:mostkdm/core/errors/app_exception.dart';
import 'package:mostkdm/features/advertisement/data/models/category_ads_result.dart';
import 'package:mostkdm/features/home/data/datasource/sub_categories_remote_data_source.dart';

abstract class SubCategoriesRepository {
  Future<Either<AppException, CategoryAdsResult>> getCategoryAds({
    required int categoryId,
    int? subCategoryId,
  });
}

class SubCategoriesRepositoryImpl implements SubCategoriesRepository {
  final SubCategoryRemoteDataSource _remoteDataSource;

  SubCategoriesRepositoryImpl({SubCategoryRemoteDataSource? remoteDataSource})
      : _remoteDataSource =
            remoteDataSource ?? SubCategoryRemoteDataSourceImpl();
  @override
  Future<Either<AppException, CategoryAdsResult>> getCategoryAds({
    required int categoryId,
    int? subCategoryId,
  }) async {
    try {
      final result = await _remoteDataSource.getCategoryAds(
        categoryId: categoryId,
        subCategoryId: subCategoryId,
      );
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }
}
