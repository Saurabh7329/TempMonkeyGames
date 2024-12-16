import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:freeplay/core/dio/dio_interceptor.dart';
import 'package:freeplay/core/error/custom_exception.dart';
import 'package:freeplay/core/error/error_type.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppDio {
  AppDio() {
    options = BaseOptions(
      contentType: Headers.jsonContentType,
      connectTimeout: 15000,
      receiveTimeout: 15000,
      validateStatus: (status) => (status ?? 500) <= 201,
    );
    _dio.interceptors.addAll([dioLoggerInterceptor, DioInterceptor()]);
  }

  late BaseOptions options;

  late final Dio _dio = Dio(options);

  Future<Response<dynamic>> getRequest({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onReceiveProgress,
    Options? options,
  }) =>
      _errorHandler(() {
        if (headers != null) {
          _dio.options.headers.addAll(headers);
        }

        return _dio.get<dynamic>(
          path,
          queryParameters: queryParameters,
          onReceiveProgress: onReceiveProgress,
          options: options,
        );
      });

  Future<Response<dynamic>> postRequest({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) =>
      _errorHandler(() {
        if (headers != null) {
          _dio.options.headers.addAll(headers);
        }
        return _dio.post<dynamic>(
          path,
          data: data,
          queryParameters: queryParameters,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        );
      });

  Future<Response<dynamic>> putRequest({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) =>
      _errorHandler(() async {
        if (headers != null) {
          _dio.options.headers.addAll(headers);
        }
        return _dio.put(
          path,
          data: data,
          queryParameters: queryParameters,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        );
      });

  Future<Response<dynamic>> patchRequest({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) =>
      _errorHandler(() async {
        if (headers != null) {
          _dio.options.headers.addAll(headers);
        }
        return _dio.patch(
          path,
          data: data,
          queryParameters: queryParameters,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        );
      });

  Future<Response<dynamic>> deleteRequest({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) =>
      _errorHandler(() async {
        if (headers != null) {
          _dio.options.headers.addAll(headers);
        }
        return _dio.delete(
          path,
          data: data,
          queryParameters: queryParameters,
        );
      });

  Future<Response<dynamic>> _errorHandler(
    Future<Response<dynamic>> Function() request,
  ) async {
    try {
      final response = await request();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else if (response.statusCode == 401) {
        throw CustomException(ErrorType.unauthorized);
      } else {
        throw CustomException(ErrorType.unmodified);
      }
    } on SocketException {
      throw CustomException(ErrorType.internet);
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.cancel:
          throw CustomException(ErrorType.dio_cancel);
        case DioErrorType.connectTimeout:
          throw CustomException(ErrorType.dio_connect_timeout);
        case DioErrorType.other:
          throw CustomException(ErrorType.dio_other);
        case DioErrorType.receiveTimeout:
          throw CustomException(ErrorType.dio_receive_timeout);
        case DioErrorType.response:
          switch (e.response?.statusCode) {
            case 400:
              String? message;
              if (e.response?.data != null && e.response?.data is Map) {
                message = e.response?.data['message'];
              }
              throw CustomException(ErrorType.dio_400, message: message);
            default:
              throw CustomException(ErrorType.dio_response, message: e.response?.data['message']);
          }
        // switch (e.response?.statusCode) {
        //   case 400:
        //     throw CustomException(ErrorType.dio_400);
        //   case 401:
        //     throw CustomException(ErrorType.dio_401);
        //   case 403:
        //     throw  CustomException(ErrorType.dio_403);
        //   case 404:
        //     throw  CustomException(ErrorType.dio_404);
        //   case 500:
        //     throw  CustomException(ErrorType.dio_500);
        //   case 504:
        //     throw  CustomException(ErrorType.dio_504);
        //   default:
        //     throw  CustomException(ErrorType.unmodified);
        // }
        case DioErrorType.sendTimeout:
          throw CustomException(ErrorType.dio_send_timeout);
      }
    } catch (e) {
      throw CustomException(ErrorType.unmodified);
    }
  }
}
