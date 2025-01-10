import 'package:app/core/constants.dart';
import 'package:app/features/home/bindings/home_binding.dart';
import 'package:app/features/home/presentation/view/home_screen.dart';
import 'package:app/features/root/presentation/view/root_screen.dart';
import 'package:app/features/splash/presentation/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> getPages = [
    GetPage(
      name: RouteConstants.splashRoute,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: RouteConstants.rootRoute,
      page: () => RootScreen(),
      children: [
        GetPage(
          name: RouteConstants.homeRoute,
          page: () => HomeScreen(),
          binding: HomeBinding(),
        ),
      ],
    ),
  ];

  static String initialPage() {
    return RouteConstants.splashRoute;
  }
}
