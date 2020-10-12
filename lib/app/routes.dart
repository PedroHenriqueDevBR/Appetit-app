import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/views/LoginPage/login.page.dart';

class AppRoute {
  static const String LOGIN_ROUTE = '/login_route';
  static const String DASHBOARD_ROUTE = '/dashboard_route';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    dynamic args = settings.arguments;

    switch (settings.name) {
      case LOGIN_ROUTE:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
    }
  }
}