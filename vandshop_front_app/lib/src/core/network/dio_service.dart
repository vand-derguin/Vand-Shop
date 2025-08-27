import 'package:dio/dio.dart';
import 'package:vandshop_front_app/src/core/network/network_logger.dart';

class DioService {
  Dio dioService() {
    Dio _dio = Dio();
    _dio.options.baseUrl = '';
    _dio.interceptors.add(Logging());
    _dio.options.headers = {'Content-Type': 'application/json'};
    _dio.options.connectTimeout = const Duration(seconds: 60);
    _dio.options.receiveTimeout = const Duration(seconds: 60);
    return _dio;
  }
}
