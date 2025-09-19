import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/auth_repository.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());

final authTokenProvider = StateProvider<String?>((ref) => null);

final authUserProvider = StateProvider<Map<String, dynamic>?>((ref) => null);

final authControllerProvider = Provider((ref) {
  final repo = ref.read(authRepositoryProvider);

  return AuthController(ref, repo);
});

class AuthController {
  final Ref ref;
  final AuthRepository repo;

  AuthController(this.ref, this.repo);

  Future<bool> login(String email, String password) async {
    final result = await repo.login(email, password);
    if (result["status"] == true) {
      ref.read(authTokenProvider.notifier).state = result["token"];
      ref.read(authUserProvider.notifier).state = result["user"];
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    final token = ref.read(authTokenProvider);
    if (token != null) {
      await repo.logout(token);
    }
    ref.read(authTokenProvider.notifier).state = null;
    ref.read(authUserProvider.notifier).state = null;
  }
}