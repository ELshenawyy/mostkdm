import 'package:dio/dio.dart';
import 'package:mostkdm/core/cache/cache_helper.dart';
import 'api_endpoints.dart';
class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;
  DioClient._internal();

  String? _memoryToken;
  void setToken(String? token) => _memoryToken = token;

  Future<void> init() async {
  _memoryToken = CacheHelper().getToken();
}

  late final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  )..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_memoryToken != null) {
            options.headers['Authorization'] = 'Bearer $_memoryToken';
          }
          return handler.next(options);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );

  Dio get dio => _dio;

  Future<void> saveToken(String token) async {
    _memoryToken = token;
    await CacheHelper().setString('token', token);
  }

  Future<void> deleteToken() async {
    _memoryToken = null;
    await CacheHelper().remove('token');
  }

  String? getToken() => _memoryToken;
}
