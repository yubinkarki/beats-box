import 'package:flutter/material.dart';

import 'package:beats_box/constants/constants_barrel.dart' show AppRoutes;
import 'package:beats_box/views/views_barrel.dart'
    show HomeView, LoginView, InitialView, RegisterView, PageNotFoundView;

class AppRouter {
  static Route<dynamic> getRoute(RouteSettings routes) {
    switch (routes.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => const HomeView());

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
