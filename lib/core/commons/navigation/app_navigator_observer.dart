import 'package:flutter/material.dart';

class AppNavigatorObserver extends NavigatorObserver {
  final Function(Route<dynamic>, Route<dynamic>?)? onPush;
  final Function(Route<dynamic>, Route<dynamic>?)? onPop;

  AppNavigatorObserver({this.onPush, this.onPop});

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (onPush != null) {
      onPush!(route, previousRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (onPop != null) {
      onPop!(route, previousRoute);
    }
  }
}
