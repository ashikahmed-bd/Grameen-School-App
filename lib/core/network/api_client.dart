import 'package:dio/dio.dart';

import '../config/app_config.dart';
import '../constants/storage_keys.dart';
import '../storage/secure_storage.dart';
import 'network_exception.dart';

class ApiClient {
  late final Dio dio;

  ApiClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        connectTimeout: AppConfig.connectTimeout,
        receiveTimeout: AppConfig.receiveTimeout,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SecureStorage.read(StorageKeys.token);

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          handler.next(options);
        },
        onError: (error, handler) {
          handler.next(error);
        },
      ),
    );
  }

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: query,
      );

      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<dynamic> post(
    String path, {
    dynamic data,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: data,
      );

      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<dynamic> put(
    String path, {
    dynamic data,
  }) async {
    try {
      final response = await dio.put(
        path,
        data: data,
      );

      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<dynamic> patch(
    String path, {
    dynamic data,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: data,
      );

      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<dynamic> delete(
    String path, {
    dynamic data,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: data,
      );

      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  NetworkException _handleError(DioException error) {
    final response = error.response;

    if (response != null) {
      return NetworkException(
        message:
            response.data?['message'] ??
            'Something went wrong.',
        statusCode: response.statusCode,
        data: response.data,
      );
    }

    return NetworkException(
      message: 'Unable to connect to the server.',
    );
  }
}