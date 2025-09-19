import 'api_client.dart';

class AuthRepository {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> register(String name, String email, String password) {
    return _apiClient.register(name, email, password);
  }

  Future<Map<String, dynamic>> login(String email, String password) {
    return _apiClient.login(email, password);
  }

  Future<Map<String, dynamic>> getProfile(String token) {
    return _apiClient.getProfile(token);
  }

  Future<Map<String, dynamic>> logout(String token) {
    return _apiClient.logout(token);
  }
}