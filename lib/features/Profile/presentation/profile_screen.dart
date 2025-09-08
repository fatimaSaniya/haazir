import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/text_constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final bool isLoggedIn = true; // 🔹 replace with real auth state later

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.background,
      appBar: AppBar(
        // Gradient AppBar (from your style)
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
          TextConstants.profile, // add this in your TextConstants
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

      body: isLoggedIn
          ? _buildLoggedIn(context)
          : _buildGuest(context), // 🔹 show correct state
    );
  }

  // 🔹 Guest / Not Logged In
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

            // Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.primaryOrange.withOpacity(0.7),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  // Navigate to Login
                },
                child: const Text("Login", style: TextStyle(fontSize: 16),),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: ColorConstants.primaryBlue,
                  side: BorderSide(color: ColorConstants.primaryBlue),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  // Navigate to Sign Up
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
  Widget _buildLoggedIn(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // User avatar + info
          const CircleAvatar(
            radius: 45,
            backgroundColor: ColorConstants.softBlue,
            backgroundImage: AssetImage("assets/images/hazeer_lady.png"), // dummy
          ),
          const SizedBox(height: 12),
          Text(
            "Saniya",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: ColorConstants.textPrimary,
            ),
          ),
          Text(
            "saniya@example.com",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ColorConstants.textSecondary,
            ),
          ),
          const SizedBox(height: 20),

          // Options List
          _menuTile(Icons.history, "My Bookings", onTap: () {}),
          _menuTile(Icons.favorite_border, "Wishlist", onTap: () {}),
          _menuTile(Icons.help_outline, "Help & Support", onTap: () {}),
          _menuTile(Icons.logout, "Logout", onTap: () {}),
        ],
      ),
    );
  }

  // 🔹 Helper for menu items
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