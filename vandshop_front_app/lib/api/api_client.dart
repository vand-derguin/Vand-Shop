import 'dart:convert';
import 'package:http/http.dart' as http;
import 'token_storage.dart';

class ApiClient {
  final String baseUrl;
  final TokenStorage tokenStorage;

  ApiClient({required this.baseUrl, required this.tokenStorage});

  Future<String?> login(String username, String password) async {
    final res = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (res.statusCode == 200) {
      final token = jsonDecode(res.body)['access_token'];
      await tokenStorage.saveToken(token);
      return token;
    }
    throw Exception('Login failed');
  }

  Future<List<dynamic>> fetchProducts() async {
    final token = await tokenStorage.getToken();
    final res = await http.get(
      Uri.parse('$baseUrl/products'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    throw Exception('Failed to fetch products');
  }

  Future<void> checkout(List<Map<String, dynamic>> cart) async {
    final token = await tokenStorage.getToken();
    final res = await http.post(
      Uri.parse('$baseUrl/checkout'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'items': cart}),
    );

    if (res.statusCode != 200) {
      throw Exception('Checkout failed');
    }
  }
}
