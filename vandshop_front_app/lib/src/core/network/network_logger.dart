import 'package:dio/dio.dart';
import 'package:vandshop_front_app/src/core/network/logger.dart';

class Logging extends InterceptorsWrapper {
  Logging();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers["Accept"] = "application/json";
    if (options.headers["ContentType"] == "") {
      options.headers["ContentType"] = "application/json";
    }
    logger.i(
      'REQUEST[${options.method}]=> PATH: ${options.baseUrl}${options.path}=> QUERY PARAMS: ${options.queryParameters}=> AUTH: ${options.headers}',
    );
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i(
      'RESPONSE[${response.statusCode}]=> PATH: ${response.requestOptions.path} => DATA:${response.data}',
    );
    return handler.next(response);
  }

  @override
  Future OnError(DioException err, ErrorInterceptorHandler handler) async {
    logger.e(
      "Resquest Error message :: ${err.message} ++ Err type ${err.type} >>> whole error ${err.response}",
    );
    return handler.next(err);
  }
}
