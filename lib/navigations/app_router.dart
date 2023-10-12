import 'package:flutter/material.dart';

import 'package:beats_box/views/views_barrel.dart';
import 'package:beats_box/constants/constants_barrel.dart';

class AppRouter {
  static Route<dynamic> getRoute(RouteSettings routes) {
    switch (routes.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (context) => const LoginView());

      case AppRoutes.initial:
        return MaterialPageRoute(builder: (context) => const InitialView());

      case AppRoutes.register:
        return MaterialPageRoute(builder: (context) => const RegisterView());

      default:
        return MaterialPageRoute(builder: (context) => const PageNotFoundView());
    }
  }
}
