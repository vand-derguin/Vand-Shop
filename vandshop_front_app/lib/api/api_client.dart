import 'dart:convert';
import 'package:http/http.dart' as http;
import 'token_storage.dart';
import 'api_routes.dart';

class ApiClient {
  final String baseUrl;
  String? _token;
  final TokenStorage tokenStorage;
  setToken(String token) => _token = token;
  ApiClient({required this.baseUrl, required this.tokenStorage});

  Future<List<dynamic>> getProducts() async {
    final response = await http.get(
      Uri.parse('$baseUrl${ApiRoutes.products}'), // or '/products'
      headers: {
        'Content-Type': 'application/json',
        if (_token != null) 'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load products: ${response.body}');
    }
  }

  Future<String?> login(String username, String password) async {
    final res = await http.post(
      Uri.parse("$baseUrl${ApiRoutes.login}"),
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
      Uri.parse("$baseUrl${ApiRoutes.products}"),
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
      Uri.parse("$baseUrl${ApiRoutes.checkout}"),
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
