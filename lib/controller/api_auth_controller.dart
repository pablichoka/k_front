abstract class ApiAuthController {
  Future<bool> login(String username, String password);

  Future<bool> logout();
}