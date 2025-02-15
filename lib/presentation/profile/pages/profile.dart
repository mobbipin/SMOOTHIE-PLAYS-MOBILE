// lib/presentation/pages/profile_page.dart
import 'package:flutter/material.dart';
import 'package:smoothie_plays_mobile/core/configs%20/assets/app_image.dart';
import 'package:smoothie_plays_mobile/core/configs%20/theme/app_colors.dart';
import 'package:smoothie_plays_mobile/data/models/auth/auth_api_model.dart';

class ProfilePage extends StatelessWidget {
  final AuthApiModel user;
  const ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Display dynamic user info.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(user.fullName),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _profileInfo(context),
            const SizedBox(height: 30),
            _favoriteSongs(),
          ],
        ),
      ),
    );
  }

  Widget _profileInfo(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.5,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: user.imageUrl.isNotEmpty
                    ? NetworkImage(user.imageUrl)
                    : AssetImage(AppImages.defaultPhoto) as ImageProvider,
                fit: BoxFit.cover,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Text(
            user.email,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Text(
            user.fullName,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _favoriteSongs() {
    // Later, you can populate this dynamically.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Favorite Songs',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        SizedBox(height: 20),
        Text('No favorite songs yet.'),
      ],
    );
  }
}
