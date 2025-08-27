import 'package:vandshop_front_app/src/core/network/dio_service.dart';

class ProductRepository {
  final DioService dio;
  ProductRepository({required this.dio}); // Dependency Injection
}
