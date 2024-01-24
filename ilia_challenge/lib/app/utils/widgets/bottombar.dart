import 'package:flutter/material.dart';
import 'package:ilia_challenge/app/features/home/screens/home_screen.dart';
import 'package:ilia_challenge/app/features/search/screens/search_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavScreen extends StatefulWidget {
  static const String routeName = '/bottom-bar';

  const BottomNavScreen({super.key});

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _getScreensUsers() {
      return [const HomeScreen(), SearchScreen()];
    }

    List<SalomonBottomBarItem> itensUsers = [
      SalomonBottomBarItem(
        icon: const Icon(Icons.home_outlined),
        title: const Text("Home"),
        selectedColor: Colors.white,
        activeIcon: const Icon(Icons.home, color: Colors.white),
      ),
      SalomonBottomBarItem(
        icon: const Icon(Icons.search_outlined),
        title: const Text("Search"),
        selectedColor: Colors.white,
        activeIcon: const Icon(Icons.search, color: Colors.white),
      ),
    ];

    List<Widget> _screensUsers = _getScreensUsers();

    return Scaffold(
      body: _screensUsers[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.black87,
        margin: const EdgeInsets.all(12.0),
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 9) {
            return;
          } else {
            setState(() => _currentIndex = index);
          }
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          ...itensUsers,
        ],
      ),
    );
  }
}
