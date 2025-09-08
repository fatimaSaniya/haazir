import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:haazir/features/Dashboard/main_dashboard.dart';
import '../../features/Booking/presentation/booking_screen.dart';
import '../../features/Profile/presentation/profile_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/categories/presentation/categories_screen.dart';

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
        ],
      ),
    ],
  );
});