import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/screens/booking_screen.dart';
import '../../features/screens/main_dashboard.dart';
import '../../features/screens/profile_screen.dart';
import '../../features/screens/categories_screen.dart';
import '../../features/screens/home_screen.dart';
import '../../features/screens/login_screen.dart';
import '../../features/screens/register_screen.dart';


final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      // SHELL with bottom nav
      ShellRoute(
        builder: (context, state, child) {
          return MainDashboard(child: child); // pass child into dashboard
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/categories',
            builder: (context, state) => const CategoriesScreen(),
          ),
          GoRoute(
            path: '/booking',
            builder: (context, state) => const BookingScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            path: '/login',
            builder: (context, state) => const LoginScreen(),
          ),
          GoRoute(
            path: '/register',
            builder: (context, state) => const RegisterScreen(),
          ),
        ],
      ),
    ],
  );
});