import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haazir/features/screens/register_screen.dart';
import 'package:lottie/lottie.dart';
import '../../constants/color_constants.dart';
import '../../constants/string_constants.dart';
import '../auth/providers/auth_provider.dart';
import 'login_screen.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authUserProvider); // null if not logged in

    return Scaffold(
      backgroundColor: ColorConstants.background,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorConstants.primaryBlue.withOpacity(0.8),
                ColorConstants.primaryOrange.withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          StringConstants.profile,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            color: Colors.white,
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: user == null ? _buildGuest(context) : _buildLoggedIn(context, ref, user),
    );
  }

  // 🔹 Guest (not logged in)
  Widget _buildGuest(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/images/profile_placeholder.json", height: 180),
            const SizedBox(height: 20),
            Text(
              "Welcome to Haazir 👋",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorConstants.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "Login or create an account to track your bookings & manage your profile.",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorConstants.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Login Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.primaryOrange.withOpacity(0.7),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                },
                child: const Text("Login", style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 12),

            // Sign Up Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: ColorConstants.primaryBlue,
                  side: const BorderSide(color: ColorConstants.primaryBlue),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RegisterScreen()),
                  );
                },
                child: const Text("Sign Up"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Logged In
  Widget _buildLoggedIn(BuildContext context, WidgetRef ref, Map<String, dynamic> user) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundColor: ColorConstants.softBlue,
            backgroundImage: user["avatar"] != null
                ? NetworkImage(user["avatar"]) as ImageProvider
                : const AssetImage("assets/images/hazeer_lady.png"),
          ),
          const SizedBox(height: 12),
          Text(
            user["name"] ?? "User",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: ColorConstants.textPrimary,
            ),
          ),
          Text(
            user["email"] ?? "",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ColorConstants.textSecondary,
            ),
          ),
          const SizedBox(height: 20),

          // Options
          _menuTile(Icons.history, "My Bookings", onTap: () {}),
          _menuTile(Icons.favorite_border, "Wishlist", onTap: () {}),
          _menuTile(Icons.help_outline, "Help & Support", onTap: () {}),

          // Logout
          _menuTile(Icons.logout, "Logout", onTap: () {
            ref.read(authControllerProvider).logout();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Logged out successfully")),
            );
          }),
        ],
      ),
    );
  }

  // 🔹 Helper menu tile
  Widget _menuTile(IconData icon, String title, {VoidCallback? onTap}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: ColorConstants.primaryOrange),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}