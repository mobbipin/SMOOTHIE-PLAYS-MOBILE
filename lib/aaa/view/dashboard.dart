import 'package:flutter/material.dart';
import 'package:smoothie_plays_mobile/aaa/view/home_screen.dart';
import 'package:smoothie_plays_mobile/aaa/view/library_screen.dart';
import 'package:smoothie_plays_mobile/aaa/view/search_screen.dart';
import 'package:smoothie_plays_mobile/data/models/auth/auth_api_model.dart';

import 'profile_screen.dart'; // Import ProfileScreen

class DashboardScreen extends StatefulWidget {
  final AuthApiModel user; // Expect the user data in the constructor

  const DashboardScreen({super.key, required this.user}); // Pass user data

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // You can initialize this list inside the build method
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    // Initialize the list of widgets here, after the widget is fully initialized
    _widgetOptions = <Widget>[
      HomeScreen(),
      SearchScreen(),
      LibraryScreen(),
      ProfileScreen(user: widget.user), // Pass the user data to ProfileScreen
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard',
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(color: Colors.white)),
        backgroundColor: Color(0xFF800000),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Color(0xFF800000),
        selectedItemColor: const Color.fromARGB(255, 2, 0, 0),
        unselectedItemColor:
            const Color.fromARGB(255, 7, 1, 1).withOpacity(0.6),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
