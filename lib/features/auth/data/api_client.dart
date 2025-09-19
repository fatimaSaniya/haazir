import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://thehaazir.com/api/", // ✅ must include /api/
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    headers: {"Accept": "application/json"},
    followRedirects: true,
    validateStatus: (status) => status! < 500, // allow 3xx/4xx responses
  ));

  Future<Map<String, dynamic>> register(String name, String email, String password) async {
    final String url = "register";

    // 🔹 Debug info before request
    print("=== Register API DEBUG ===");
    print("URL: ${_dio.options.baseUrl}$url");
    print("Method: POST");
    print("Headers: ${_dio.options.headers}");
    print("Body: {name: $name, email: $email, password: $password}");

    try {
      final response = await _dio.post(
        url,
        data: {"name": name, "email": email, "password": password},
      );

      // 🔹 Debug info after response
      print("Response Status Code: ${response.statusCode}");
      print("Response Data: ${response.data}");
      print("==========================");

      return Map<String, dynamic>.from(response.data);
    } on DioException catch (e) {
      print("DioException Status: ${e.response?.statusCode}");
      print("DioException Data: ${e.response?.data}");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final String url = "login";

    print("=== Login API DEBUG ===");
    print("URL: ${_dio.options.baseUrl}$url");
    print("Method: POST");
    print("Body: {email: $email, password: $password}");

    try {
      final response = await _dio.post(
        url,
        data: {"email": email, "password": password},
      );
      print("Response Status Code: ${response.statusCode}");
      print("Response Data: ${response.data}");
      print("=======================");
      return Map<String, dynamic>.from(response.data);
    } on DioException catch (e) {
      print("DioException Status: ${e.response?.statusCode}");
      print("DioException Data: ${e.response?.data}");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getProfile(String token) async {
    final String url = "profile";

    print("=== Profile API DEBUG ===");
    print("URL: ${_dio.options.baseUrl}$url");
    print("Method: GET");
    print("Headers: Authorization: Bearer $token");

    try {
      final response = await _dio.get(
        url,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      print("Response Status Code: ${response.statusCode}");
      print("Response Data: ${response.data}");
      print("========================");
      return Map<String, dynamic>.from(response.data);
    } on DioException catch (e) {
      print("DioException Status: ${e.response?.statusCode}");
      print("DioException Data: ${e.response?.data}");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> logout(String token) async {
    final String url = "logout";

    print("=== Logout API DEBUG ===");
    print("URL: ${_dio.options.baseUrl}$url");
    print("Method: POST");
    print("Headers: Authorization: Bearer $token");

    try {
      final response = await _dio.post(
        url,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      print("Response Status Code: ${response.statusCode}");
      print("Response Data: ${response.data}");
      print("========================");
      return Map<String, dynamic>.from(response.data);
    } on DioException catch (e) {
      print("DioException Status: ${e.response?.statusCode}");
      print("DioException Data: ${e.response?.data}");
      rethrow;
    }
  }
}
