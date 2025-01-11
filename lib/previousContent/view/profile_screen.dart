import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background for Profile screen
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/images/logosmall.png'), // Profile image
            ),
            SizedBox(height: 16),
            // Name
            Text(
              'John Doe',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium, // Use displayMedium for bold text
            ),
            SizedBox(height: 8),
            // Job or Description
            Text(
              'Music Enthusiast',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium, // Regular text for description
            ),
            SizedBox(height: 16),
            // Edit Profile Button
            ElevatedButton(
              onPressed: () {
                // Add edit profile logic here
              },
              child: Text(
                'Edit Profile',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge, // Regular font for button text
              ),
            ),
            SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              ),
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
