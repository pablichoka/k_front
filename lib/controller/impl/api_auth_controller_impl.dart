import 'dart:convert';

import 'package:k_front/controller/api_auth_controller.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';

class ApiAuthServiceImpl implements ApiAuthController {
  final String _baseUrl = 'http://localhost:8081';

  @override
  Future<bool> login(String username, String password) async {
    Uri uri = Uri.parse('$_baseUrl/login');
    final response = await http.post(uri,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: json.encode({'username': username, 'password': password}));
    if (response.statusCode == 200) {
      await storage.write(
          key: 'accessToken',
          value: (jsonDecode(response.body)['accessToken']));
      await storage.write(
          key: 'refreshToken',
          value: (jsonDecode(response.body)['refreshToken']));
      await storage.write(key: 'id', value: jsonDecode(response.body)['id']);
      await storage.write(
          key: 'role', value: jsonDecode(response.body)['role']);
      return true;
    } else {
      throw Exception('Failed to login');
    }
  }

  @override
  Future<bool> logout() async {
    Uri uri = Uri.parse('$_baseUrl/logout');
    final accessToken = await storage.read(key: 'accessToken');
    final response = await http.post(uri, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $accessToken'
    });
    if (response.statusCode == 200) {
      await storage.delete(key: 'accessToken');
      await storage.delete(key: 'id');
      await storage.delete(key: 'role');
      return true;
    } else {
      throw Exception('Logout failed');
    }
  }

}