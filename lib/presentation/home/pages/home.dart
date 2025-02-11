import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smoothie_plays_mobile/common/mode/is_dark_mode.dart';
import 'package:smoothie_plays_mobile/core/configs%20/assets/app_image.dart';
import 'package:smoothie_plays_mobile/core/configs%20/assets/app_vectors.dart';
import 'package:smoothie_plays_mobile/core/configs%20/theme/app_colors.dart';
import 'package:smoothie_plays_mobile/data/models/auth/auth_api_model.dart';
import 'package:smoothie_plays_mobile/presentation/player/pages/player.dart';

import '../../../common/widgets/appbar/app_bar.dart';

class HomePage extends StatefulWidget {
  final AuthApiModel user;

  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        action: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => SongPlayerPage()),
            );
          },
          icon: const Icon(Icons.person, size: 30),
        ),
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _homeTopCard(),
            SizedBox(height: 24),
            _tabs(),
            SizedBox(
              height: 260,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTabContent('News'),
                  _buildTabContent('Videos'),
                  _buildTabContent('Artists'),
                  _buildTabContent('Podcasts'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        height: 180, // Increased height for better visual balance
        child: Stack(
          children: [
            Positioned.fill(
              bottom: 10,
              child: SvgPicture.asset(AppVectors.homeTopCard),
            ),
            Positioned(
              bottom: 0,
              right: 40,
              child: Image.asset(
                AppImages.homeArtist,
                height: 120, // Controlled height for better proportion
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16.0), // Padding around the tabs for better spacing
      child: Center(
        // Centers the TabBar widget horizontally
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: context.isDarkMode ? Colors.white : Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: AppColors.primary,
          indicatorWeight: 3,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
          tabs: const [
            Tab(text: 'News'),
            Tab(text: 'Videos'),
            Tab(text: 'Artists'),
            Tab(text: 'Podcasts'),
          ],
        ),
      ),
    );
  }

  // Function to provide consistent tab content structure
  Widget _buildTabContent(String title) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }
}
