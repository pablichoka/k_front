import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:k_front/controller/api_user_controller.dart';

import '../../model/user.dart';

class ApiUserControllerImpl implements ApiUserController {
  final String _baseUrl = 'http://localhost:8081';

  @override
  Future<bool> signup(User newUser) async {
    Uri uri = Uri.parse('$_baseUrl/signup');
    final response = await http.post(uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(newUser));
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to add user');
    }
  }
}
