import 'package:flutter/material.dart';

import 'package:beats_box/services/services_barrel.dart' show SharedPreferencesHelper;

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
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

    debugPrint("This is debug print");

    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: colorScheme.surface),
        child: Center(child: Text("Dashboard screen", style: textTheme.labelMedium)),
      ),
    );
  }
}
