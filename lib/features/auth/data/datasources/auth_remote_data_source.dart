import 'package:mostkdm/core/network/api_consumer.dart';
import 'package:mostkdm/core/network/api_endpoints.dart';
import 'package:mostkdm/core/network/dio_consumer.dart';
import '../models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login({required String mobile, required String password});
  Future<String> signup({required String name, required String phone, required String password});
  Future<String> verifyOtp({required String phone, required String otp});
  Future<void> changePassword({required String oldPassword, required String newPassword});
  Future<String> forgotPassword({required String phone});
  Future<void> resendOtp({required String phone});
  Future<String> verifyForgotOtp({required String phone, required String otp});
  Future<void> resetPassword({required String phone, required String code, required String password});
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiConsumer _api = DioConsumer();


  @override

  Future<AuthModel> login({
    required String mobile,
    required String password,
  }) async {
    final response = await _api.post(
      ApiEndpoints.login,
      data: {'mobile': mobile, 'password': password},
    );
    return AuthModel.fromJson(response);
  }

  @override
  Future<String> signup({
    required String name,
    required String phone,
    required String password,
  }) async {
    final response = await _api.post(
      ApiEndpoints.signup,
      data: {'name': name, 'mobile': phone, 'password': password},
    );
    return response['data']['mobile'] ?? phone;
  }

  @override

  Future<String> verifyOtp({
    required String phone,
    required String otp,
  }) async {
    final response = await _api.post(
      ApiEndpoints.verifyOtp,
      data: {'mobile': phone, 'code': otp},
    );
    return response['data']['access_token'] ?? '';
  }

  @override
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    await _api.post(
      ApiEndpoints.changePassword,
      data: {
        'old_password': oldPassword,
        'password': newPassword,
        'password_confirmation': newPassword,
      },
    );
  }

  @override
  Future<String> forgotPassword({required String phone}) async {
    final response = await _api.post(
      ApiEndpoints.forgotPassword,
      data: {'mobile': phone},
    );
    return response['data']['mobile'] ?? phone;
  }

  @override
  Future<String> verifyForgotOtp({
    required String phone,
    required String otp,
  }) async {
    final response = await _api.post(
      ApiEndpoints.verifyForgotOtp,
      data: {'mobile': phone, 'code': otp},
    );
    return response['data']['access_token'] ?? '';
  }

  @override
  Future<void> resendOtp({required String phone}) async {
    await _api.post(
      ApiEndpoints.resendOtp,
      data: {'mobile': phone},
    );
  }

  @override
  Future<void> resetPassword({
    required String phone,
    required String code,
    required String password,
  }) async {
    await _api.post(
      ApiEndpoints.resetPassword,
      data: {
        'mobile': phone,
        'code': code,
        'otp': code,
        'password': password,
        'password_confirmation': password,
      },
    );
  }

  @override
  Future<void> logout() async {
    await _api.post(ApiEndpoints.logout);
  }
}