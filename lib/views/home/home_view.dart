import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart' show FlutterNativeSplash;

import 'library_view.dart' show LibraryView;
import 'profile_view.dart' show ProfileView;
import 'dashboard_view.dart' show DashboardView;
import 'favorites_view.dart' show FavoritesView;
import 'package:beats_box/constants/constants_barrel.dart' show AppSizes, AppStrings;
import 'package:beats_box/services/services_barrel.dart' show SharedPreferencesHelper;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  late final Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    getCustomUserData();
  }

  Widget getScreens(currentIndex) {
    switch (currentIndex) {
      case 0:
        return const DashboardView();

      case 1:
        return const LibraryView();

      case 2:
        return const FavoritesView();

      case 3:
        return ProfileView(userData: userData);

      default:
        return const Placeholder();
    }
  }

  Future<void> getCustomUserData() async {
    final result = await SharedPreferencesHelper.getCustomEmailUserDetails();

    setState(() => userData = result);
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: getScreens(_currentIndex),
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
            label: AppStrings.home,
            activeIcon: Icon(Icons.cottage),
            icon: Icon(Icons.cottage_outlined),
          ),
          BottomNavigationBarItem(
            label: AppStrings.library,
            activeIcon: Icon(Icons.library_music),
            icon: Icon(Icons.library_music_outlined),
          ),
          BottomNavigationBarItem(
            label: AppStrings.favorites,
            activeIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_border),
          ),
          BottomNavigationBarItem(
            label: AppStrings.profile,
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
