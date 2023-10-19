import 'package:flutter/material.dart';

import 'package:beats_box/constants/constants_barrel.dart';
import 'package:beats_box/services/locator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: colorScheme.background),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login View", style: textTheme.labelMedium),
              const SizedBox(height: 40),
              OutlinedButton(
                onPressed: () async {
                  await Future.delayed(const Duration(milliseconds: 200));
                  Navigator.of(context).pushNamed(AppRoutes.register);
                },
                child: const Text("Navigate"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
