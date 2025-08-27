import 'package:dio/dio.dart';
import '../storage/token_storage.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'http://10.0.2.2:3000/api'),
  ); // Android emulator

  ApiClient() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await TokenStorage.read();
          if (token != null) options.headers['authorization'] = 'Bearer $token';
          handler.next(options);
        },
      ),
    );
  }
}
