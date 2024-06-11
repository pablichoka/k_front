import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:k_front/main.dart';
import 'package:k_front/models/user.dart';

class ApiService {
  static final ApiService _singleton = ApiService._();

  ApiService._();

  static ApiService get instance {
    return _singleton;
  }

  final String _baseUrl = 'http://localhost:8081';
  late String? id;
  late String? _role;

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
      id = jsonDecode(response.body)['id'];
      _role = jsonDecode(response.body)['roleName'];
      return true;
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<bool> signup(User newUser) async {
    Uri uri = Uri.parse('$_baseUrl/signup');
    final response = await http.post(uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(newUser));
    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      throw Exception('Failed to add user');
    }
  }

  Future<bool> logout(Future<String?> accessToken) async {
    Uri uri = Uri.parse('$_baseUrl/logout');
    final accessToken0 = await accessToken;
    final response = await http.post(uri, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $accessToken0'
    });
    if (response.statusCode == 200) {
      await storage.delete(key: 'accessToken');
      id = null;
      _role = null;
      return true;
    } else {
      throw Exception('Logout failed');
    }
  }

  Future<Map<String, dynamic>> getAuth(String path, String accessToken) async {
    Uri uri = Uri.parse('$_baseUrl$path');
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $accessToken'
    });
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'A ${response.statusCode} error occurred: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> getNoAuth(String path) async {
    Uri uri = Uri.parse('$_baseUrl$path');
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    });
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'A ${response.statusCode} error occurred: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> post(
      String path, Map<String, dynamic> body) async {
    Uri uri = Uri.parse('$_baseUrl$path');
    var accessToken = await storage.read(key: 'accessToken');
    final response = await http.post(uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken'
        },
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'A ${response.statusCode} error occurred: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> put(
      String path, Map<String, dynamic> body, String accessToken) async {
    Uri uri = Uri.parse('$_baseUrl$path');
    final response = await http.put(uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken'
        },
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'A ${response.statusCode} error occurred: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> delete(
      String path, Map<String, dynamic> body, String accessToken) async {
    Uri uri = Uri.parse('$_baseUrl$path');
    final response = await http.delete(uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken'
        },
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'A ${response.statusCode} error occurred: ${response.body}');
    }
  }
}
