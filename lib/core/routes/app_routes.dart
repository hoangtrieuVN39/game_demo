import 'package:app/core/constants.dart';
import 'package:app/features/home/presentation/view/home_screen.dart';
import 'package:app/features/root/presentation/view/root_screen.dart';
import 'package:flutter/material.dart';

import '../../features/splash/presentation/view/splash_screen.dart';

class AppRoutes {
  static const List<String> mainRoutes = [
    RouteConstants.splashRoute,
    RouteConstants.rootRoute,
  ];

  static const List<String> rootRoutes = [
    RouteConstants.homeRoute,
    RouteConstants.listRoute,
    RouteConstants.profileRoute,
  ];

  static bool isMainRoute(String routeName) {
    return mainRoutes.contains(routeName);
  }

  static bool isRootRoute(String routeName) {
    return rootRoutes.contains(routeName);
  }

  static Map<String, WidgetBuilder> getMainRoutes() {
    return {
      for (var route in mainRoutes) route: (context) => getScreen(route),
    };
  }

  static Map<String, WidgetBuilder> getRootRoutes() {
    return {
      for (var route in rootRoutes) route: (context) => getScreen(route),
    };
  }

  static Widget getScreen(String route) {
    debugPrint('route: $route');
    switch (route) {
      case RouteConstants.splashRoute:
        return SplashScreen();
      case RouteConstants.homeRoute:
        return HomeScreen();
      case RouteConstants.rootRoute:
        return RootScreen();
      default:
        throw Exception('Route not found');
    }
  }
}
