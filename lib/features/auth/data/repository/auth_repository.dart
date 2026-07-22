import 'package:dartz/dartz.dart';
import 'package:mostkdm/core/errors/app_exception.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/auth_model.dart';

abstract class AuthRepository {
  Future<Either<AppException, AuthModel>> login({required String phone, required String password});
  Future<Either<AppException, String>> signup({required String name, required String phone, required String password});
  Future<Either<AppException, String>> verifyOtp({required String phone, required String otp});
  Future<Either<AppException, Unit>> changePassword({required String oldPassword, required String newPassword});
  Future<Either<AppException, String>> forgotPassword({required String phone});
  Future<Either<AppException, String>> verifyForgotOtp({required String phone, required String otp});
  Future<Either<AppException, Unit>> resendOtp({required String phone});
  Future<Either<AppException, Unit>> resetPassword({required String phone, required String code, required String password});
  Future<Either<AppException, Unit>> logout();
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<Either<AppException, AuthModel>> login({
    required String phone,
    required String password,
  }) async {
    try {
      final result = await _dataSource.login(mobile: phone, password: password);
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, String>> signup({
    required String name,
    required String phone,
    required String password,
  }) async {
    try {
      final result = await _dataSource.signup(name: name, phone: phone, password: password);
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, String>> verifyOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      final result = await _dataSource.verifyOtp(phone: phone, otp: otp);
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, Unit>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      await _dataSource.changePassword(oldPassword: oldPassword, newPassword: newPassword);
      return const Right(unit);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, String>> forgotPassword({required String phone}) async {
    try {
      final result = await _dataSource.forgotPassword(phone: phone);
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, String>> verifyForgotOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      final result = await _dataSource.verifyForgotOtp(phone: phone, otp: otp);
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, Unit>> resendOtp({required String phone}) async {
    try {
      await _dataSource.resendOtp(phone: phone);
      return const Right(unit);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, Unit>> resetPassword({
    required String phone,
    required String code,
    required String password,
  }) async {
    try {
      await _dataSource.resetPassword(phone: phone, code: code, password: password);
      return const Right(unit);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, Unit>> logout() async {
    try {
      await _dataSource.logout();
      return const Right(unit);
    } on AppException catch (e) {
      return Left(e);
    }
  }
}