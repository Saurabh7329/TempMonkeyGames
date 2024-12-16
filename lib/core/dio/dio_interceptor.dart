import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freeplay/core/constants/constants.dart';
import 'package:freeplay/core/local_storage/local_storage_service.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = LocalStorage.getString(SHARED_PREFS_ACCESS_TOKEN);
    options.headers['Authorization'] = 'Bearer $token';
    // const token = '1|op7QussNbCpjz1pPACxgYRWCL2LxBy11SwwmloKC';
    // options.headers['Authorization'] = 'Bearer $token';
    options.headers['app-api-key'] = dotenv.env['APP_API_KEY'];
    options.baseUrl = dotenv.env['ENDPOINT']!;
    handler.next(options);
  }
}
