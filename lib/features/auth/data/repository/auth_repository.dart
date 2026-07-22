import 'package:dio/dio.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/auth_model.dart';

abstract class AuthRepository {
  Future<AuthModel> login({required String phone, required String password});
  Future<String> signup(
      {required String name, required String phone, required String password});
  Future<String> verifyOtp({required String phone, required String otp});
  Future<void> changePassword(
      {required String oldPassword, required String newPassword});

  Future<String> forgotPassword({required String phone});
  Future<String> verifyForgotOtp({required String phone, required String otp});
  Future<void> resendOtp({required String phone});
  Future<void> resetPassword({
  required String phone,
  required String code,
  required String password,
});

  Future<void> logout();
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<AuthModel> login({
    required String phone,
    required String password,
  }) async {
    try {
      return await _dataSource.login(
        mobile: phone,
        password: password,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<String> signup({
    required String name,
    required String phone,
    required String password,
  }) async {
    try {
      return await _dataSource.signup(
          name: name, phone: phone, password: password);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<String> verifyOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      return await _dataSource.verifyOtp(phone: phone, otp: otp);
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? 'كود غير صحيح';
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      await _dataSource.changePassword(
          oldPassword: oldPassword, newPassword: newPassword);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _dataSource.logout();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  String _handleError(DioException e) {
    final data = e.response?.data;
    if (data != null && data['message'] != null) {
      return data['message'];
    }
    return switch (e.type) {
      DioExceptionType.connectionTimeout => 'انتهت مهلة الاتصال',
      DioExceptionType.receiveTimeout => 'انتهت مهلة الاستقبال',
      DioExceptionType.connectionError => 'لا يوجد اتصال بالإنترنت',
      _ => 'حدث خطأ غير متوقع',
    };
  }

  @override
  Future<String> forgotPassword({required String phone}) async {
    try {
      return await _dataSource.forgotPassword(phone: phone);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<void> resendOtp({required String phone}) async {
    try {
      return await _dataSource.resendOtp(phone: phone);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<String> verifyForgotOtp(
      {required String phone, required String otp}) async {
    try {
      return await _dataSource.verifyForgotOtp(phone: phone, otp: otp);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
  @override
Future<void> resetPassword({
  required String phone,
  required String code,
  required String password,
}) async {
  try {
    await _dataSource.resetPassword(
      phone: phone,
      code: code,
      password: password,
    );
  } on DioException catch (e) {
    throw _handleError(e);
  }
}
}
