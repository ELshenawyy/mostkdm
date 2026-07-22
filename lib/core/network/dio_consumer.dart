import 'package:dio/dio.dart';
import 'package:mostkdm/core/errors/app_exception.dart';
import 'package:mostkdm/core/errors/error_model.dart';
import 'package:mostkdm/core/network/api_consumer.dart';
import 'package:mostkdm/core/network/dio_client.dart';

class DioConsumer implements ApiConsumer {
  final Dio _dio = DioClient().dio;

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<dynamic> post(String path, {dynamic data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<dynamic> put(String path, {dynamic data}) async {
    try {
      final response = await _dio.put(path, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<dynamic> delete(String path) async {
    try {
      final response = await _dio.delete(path);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<dynamic> patch(String path, {dynamic data}) async {
    try {
      final response = await _dio.patch(path, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  dynamic _handleResponse(Response response) {
    if (response.data['status'] == false) {
      throw AppException(
        message: response.data['message'] ?? 'حدث خطأ',
        statusCode: response.statusCode,
      );
    }
    return response.data;
  }

  AppException _handleDioError(DioException e) {
    final data = e.response?.data;
    final message = data != null
        ? ErrorModel.fromJson(data).message
        : switch (e.type) {
            DioExceptionType.connectionTimeout => 'انتهت مهلة الاتصال',
            DioExceptionType.receiveTimeout => 'انتهت مهلة الاستقبال',
            DioExceptionType.connectionError => 'لا يوجد اتصال بالإنترنت',
            _ => 'حدث خطأ غير متوقع',
          };
    return AppException(
      message: message,
      statusCode: e.response?.statusCode,
    );
  }
}
