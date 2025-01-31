import 'package:flutter/material.dart';
import 'package:smoothie_plays_mobile/data/models/auth/auth_api_model.dart';
import 'package:smoothie_plays_mobile/presentation/auth/pages/signin.dart'; // Ensure to import SigninPage for navigation

class ProfileScreen extends StatelessWidget {
  final AuthApiModel user; // Accept the user data

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFF800000),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context), // Logout when pressed
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display profile picture and name
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.photo), // User's photo
            ),
            const SizedBox(height: 16),
            Text(
              user.fullName, // User's full name
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              user.fullName, // User's email
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            // Add more profile data if needed
            const SizedBox(height: 30),

            // You can also add the logout functionality here
            ElevatedButton(
              onPressed: () => _logout(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF800000), // Match the app bar color
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'LOGOUT',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Handle logout
  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SigninPage()),
      (route) => false, // Remove all previous routes
    );
  }
}
