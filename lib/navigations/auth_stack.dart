import 'package:flutter/material.dart';

import 'package:beats_box/views/views_barrel.dart';
import 'package:beats_box/constants/constants_barrel.dart';

// This is not used, here for example.
MaterialPageRoute authStack(String? routeName) {
  switch (routeName) {
    case AppRoutes.initial:
      return MaterialPageRoute(builder: (context) => const LoginView());

    case AppRoutes.register:
      return MaterialPageRoute(builder: (context) => const RegisterView());

    default:
      return MaterialPageRoute(builder: (context) => const PageNotFoundView());
  }
}
