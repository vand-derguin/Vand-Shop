import '../../../core/api/api_client.dart';
import '../../../core/models/product.dart';

class ProductsRepository {
  ProductsRepository(this.api);
  final ApiClient api;

  Future<List<Product>> list({String? q}) async {
    final res = await api.dio.get(
      '/products',
      queryParameters: {if (q != null && q.isNotEmpty) 'q': q},
    );
    return (res.data as List).map((e) => Product.fromJson(e)).toList();
  }
}
