import 'package:flutter/material.dart';

import 'package:beats_box/services/services_barrel.dart' show SharedPreferencesHelper;

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  late Map<String, dynamic> customUserData;

  @override
  void initState() {
    super.initState();
    getCustomUserData();
  }

  Future<void> getCustomUserData() async {
    customUserData = await SharedPreferencesHelper.getCustomEmailUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: colorScheme.background),
        child: Center(child: Text("Fav screen", style: textTheme.labelMedium)),
      ),
    );
  }
}
