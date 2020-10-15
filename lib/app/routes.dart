import 'package:flutter/material.dart';
import 'package:maida_coffee_challenge/app/views/DashboardPage/dashboard.page.dart';
import 'package:maida_coffee_challenge/app/views/DemandInformationPage/demand_information.page.dart';
import 'package:maida_coffee_challenge/app/views/ListClientsPage/list_clients.page.dart';
import 'package:maida_coffee_challenge/app/views/LoginPage/login.page.dart';
import 'package:maida_coffee_challenge/app/views/SelectFoodPage/select_food.page.dart';

class AppRoute {
  static const String LOGIN_ROUTE = '/login_route';
  static const String DASHBOARD_ROUTE = '/dashboard_route';
  static const String DEMAND_INFORMATION_ROUTE = '/demand_information_route';
  static const String SELECT_FOOD_ROUTE = '/select_food_route';
  static const String LIST_CLIENTS_ROUTE = '/list_clients_route';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    dynamic args = settings.arguments;

    switch (settings.name) {
      case LOGIN_ROUTE:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
      case DASHBOARD_ROUTE:
        return MaterialPageRoute(
          builder: (_) => DashboardPage(),
        );
      case DEMAND_INFORMATION_ROUTE:
        return MaterialPageRoute(
          builder: (_) => DemandInformationPage(),
        );
      case SELECT_FOOD_ROUTE:
        return MaterialPageRoute(
          builder: (_) => SelectFoodPage(args),
        );
      case LIST_CLIENTS_ROUTE:
        return MaterialPageRoute(
          builder: (_) => ListClientsPage(args),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
    }
  }
}
