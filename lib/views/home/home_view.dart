import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart' show FlutterNativeSplash;

import 'library_view.dart' show LibraryView;
import 'profile_view.dart' show ProfileView;
import 'dashboard_view.dart' show DashboardView;
import 'favorites_view.dart' show FavoritesView;
import 'package:beats_box/constants/app_sizes.dart' show AppSizes;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final List<Widget> screens = const [
    DashboardView(),
    LibraryView(),
    FavoritesView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: AppSizes.s26,
        showUnselectedLabels: false,
        selectedFontSize: AppSizes.s12,
        type: BottomNavigationBarType.fixed,
        backgroundColor: colorScheme.secondary,
        selectedLabelStyle: const TextStyle(height: 1.3),
        selectedItemColor: colorScheme.secondaryContainer,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            activeIcon: Icon(Icons.cottage),
            icon: Icon(Icons.cottage_outlined),
          ),
          BottomNavigationBarItem(
            label: "Library",
            activeIcon: Icon(Icons.library_music),
            icon: Icon(Icons.library_music_outlined),
          ),
          BottomNavigationBarItem(
            label: "Favorites",
            activeIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_border),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            activeIcon: Icon(Icons.person_4),
            icon: Icon(Icons.person_4_outlined),
          ),
        ],
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
