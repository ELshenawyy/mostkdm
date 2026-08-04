import 'package:dartz/dartz.dart';
import 'package:mostkdm/core/errors/app_exception.dart';
import 'package:mostkdm/features/advertisement/data/models/category_model.dart';
import 'package:mostkdm/features/home/data/datasource/categories_remote_data_source.dart';

abstract class CategoriesRepository {
  Future<Either<AppException, List<CategoryModel>>> getAllCategories();
}

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDataSource _remoteDataSource;

  
  CategoriesRepositoryImpl(this._remoteDataSource);
      
  @override
  Future<Either<AppException, List<CategoryModel>>> getAllCategories() async {
    try {
      final categories = await _remoteDataSource.getAllCategories();
      return Right(categories);
    } on AppException catch (e) {
      return Left(e);
    }
  }
}
