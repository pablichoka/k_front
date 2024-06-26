abstract class ApiAuthService {
  Future<bool> saveLoggedUserData(String body);

  Future<bool> deleteLoggedUserData();
}