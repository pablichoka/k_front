import 'dart:convert';

import '../../main.dart';
import '../api_auth_service.dart';

class ApiAuthServiceImpl implements ApiAuthService{

  @override
  Future<bool> saveLoggedUserData(String body) async {
    try {
      await storage.write(
          key: 'accessToken',
          value: (jsonDecode(body)['accessToken']));
      await storage.write(
          key: 'refreshToken',
          value: (jsonDecode(body)['refreshToken']));
      await storage.write(key: 'id', value: jsonDecode(body)['id']);
      await storage.write(
          key: 'role', value: jsonDecode(body)['role']);
      return true;
    } on Exception catch (e) {
      throw Exception('Failed to write to storage: $e');
    }
  }

  @override
  Future<bool> deleteLoggedUserData() async{
    try {
      await storage.delete(key: 'accessToken');
      await storage.delete(key: 'id');
      await storage.delete(key: 'role');
      return true;
    } on Exception catch (e) {
      throw Exception('Failed to delete from storage: $e');
    }
  }
}