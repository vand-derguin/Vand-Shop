import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const _k = FlutterSecureStorage();
  static Future<void> write(String t) => _k.write(key: 'jwt', value: t);
  static Future<String?> read() => _k.read(key: 'jwt');
  static Future<void> clear() => _k.delete(key: 'jwt');
}
