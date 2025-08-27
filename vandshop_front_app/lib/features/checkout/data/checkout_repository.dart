import '../../../core/api/api_client.dart';
import '../../../core/models/product.dart';

class CheckoutRepository {
  CheckoutRepository(this.api);
  final ApiClient api;
  Future<Map<String, dynamic>> checkout(
    List<Map<String, dynamic>> items,
  ) async {
    final res = await api.dio.post('/sales/checkout', data: {'items': items});
    return res.data as Map<String, dynamic>;
  }
}
