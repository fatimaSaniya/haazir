
class AppConfig {
  // TODO: Use flavors (dev, prod). For now keep one base URL.
  static const String apiBaseUrl = 'https://your-laravel-domain.com/api';
  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 20);
}
