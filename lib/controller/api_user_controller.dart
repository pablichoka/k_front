import 'package:k_front/models/user.dart';

abstract class ApiUserController {

  // Future<bool> login(String username, String password);

  Future<bool> signup(User newUser);

  // Future<bool> logout();

  // Future<Map<String, dynamic>> getAuth(String path, String accessToken) async {
  //   Uri uri = Uri.parse('$_baseUrl$path');
  //   final response = await http.get(uri, headers: {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'Authorization': 'Bearer $accessToken'
  //   });
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     return jsonDecode(response.body);
  //   } else {
  //     throw Exception(
  //         'A ${response.statusCode} error occurred: ${response.body}');
  //   }
  // }

  // Future<Map<String, dynamic>> getNoAuth(String path) async {
  //   Uri uri = Uri.parse('$_baseUrl$path');
  //   final response = await http.get(uri, headers: {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //   });
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     return jsonDecode(response.body);
  //   } else {
  //     throw Exception(
  //         'A ${response.statusCode} error occurred: ${response.body}');
  //   }
  // }
  //
  // Future<Map<String, dynamic>> post(
  //     String path, Map<String, dynamic> body) async {
  //   Uri uri = Uri.parse('$_baseUrl$path');
  //   var accessToken = await storage.read(key: 'accessToken');
  //   final response = await http.post(uri,
  //       headers: {
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Authorization': 'Bearer $accessToken'
  //       },
  //       body: jsonEncode(body));
  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> data = jsonDecode(response.body);
  //     return data;
  //   } else {
  //     throw Exception(
  //         'A ${response.statusCode} error occurred: ${response.body}');
  //   }
  // }
  //
  // Future<Map<String, dynamic>> put(
  //     String path, Map<String, dynamic> body, String accessToken) async {
  //   Uri uri = Uri.parse('$_baseUrl$path');
  //   final response = await http.put(uri,
  //       headers: {
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Authorization': 'Bearer $accessToken'
  //       },
  //       body: jsonEncode(body));
  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> data = jsonDecode(response.body);
  //     return data;
  //   } else {
  //     throw Exception(
  //         'A ${response.statusCode} error occurred: ${response.body}');
  //   }
  // }
  //
  // Future<Map<String, dynamic>> delete(
  //     String path, Map<String, dynamic> body, String accessToken) async {
  //   Uri uri = Uri.parse('$_baseUrl$path');
  //   final response = await http.delete(uri,
  //       headers: {
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Authorization': 'Bearer $accessToken'
  //       },
  //       body: jsonEncode(body));
  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> data = jsonDecode(response.body);
  //     return data;
  //   } else {
  //     throw Exception(
  //         'A ${response.statusCode} error occurred: ${response.body}');
  //   }
  // }
}
