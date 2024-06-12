import 'dart:convert';

import 'package:k_front/controller/api_auth_controller.dart';
import 'package:http/http.dart' as http;
import 'package:k_front/services/api_auth_service.dart';
import 'package:k_front/services/impl/api_auth_service_impl.dart';
import '../../main.dart';

class ApiAuthControllerImpl implements ApiAuthController {
  final String _baseUrl = 'http://localhost:8081';

  final ApiAuthService authService = ApiAuthServiceImpl();

  @override
  Future<bool> login(String username, String password) async {
    Uri uri = Uri.parse('$_baseUrl/login');
    final response = await http.post(uri,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: json.encode({'username': username, 'password': password}));
    if (response.statusCode == 200) {
      bool isSaved = await authService.saveLoggedUserData(response.body);
      if (isSaved) {
        return true;
      } else {
        throw Exception('Failed to access to secure storage');
      }
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
      bool isDeleted = await authService.deleteLoggedUserData();
      if (isDeleted) {
        return true;
      } else {
        throw Exception('Failed to delete from secure storage');
      }
    } else {
      throw Exception('Logout failed');
    }
  }

}