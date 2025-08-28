import 'dart:convert';
import 'package:http/http.dart' as http;
import 'token_storage.dart';

class ApiClient {
  final String baseUrl;
  final TokenStorage tokenStorage;

  ApiClient({required this.baseUrl, required this.tokenStorage});

  /// LOGIN
  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/auth/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['token'] != null) {
        await tokenStorage.saveToken(data['token']);
      }
      return data;
    } else {
      throw Exception('Login failed: ${response.body}');
    }
  }

  // Keep your existing getProducts method here...
  Future<List<Map<String, dynamic>>> getProducts({String query = ''}) async {
    final url = Uri.parse(
      '$baseUrl/products${query.isNotEmpty ? '?q=$query' : ''}',
    );
    final token = await tokenStorage.getToken();
    final response = await http.get(
      url,
      headers: {if (token != null) 'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load products: ${response.body}');
    }
  }
}
