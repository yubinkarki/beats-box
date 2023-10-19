import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
        decoration: BoxDecoration(color: colorScheme.background),
        child: Center(child: Text("Home View", style: textTheme.labelMedium)),
      ),
    );
  }
}
