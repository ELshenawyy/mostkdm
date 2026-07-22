import 'package:dartz/dartz.dart';
import '../errors/app_exception.dart';

typedef ApiResult<T> = Future<Either<AppException, T>>;