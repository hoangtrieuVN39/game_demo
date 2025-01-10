import 'package:app/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons.dart';

class NavigationArguments {
  final Object? arguments;
  final String? tag;

  NavigationArguments({this.arguments, this.tag});
}

class AppNavigation extends GetxController {
  GlobalKey<NavigatorState> navigatorMainKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> _currentNavigatorKey = GlobalKey<NavigatorState>();

  int currentTabIndex = 0;
  bool isShowingError = false;
  bool isShowingDialogVertical = false;
  bool isShowingGeneralDialog = false;
  bool isShowingDialogNotification = false;

  Future<void> onShowErrorDialog(
      {String? title, required String message}) async {
    if (!isShowingError) {
      isShowingError = true;
      await showPlatformDialog(
          context: this.navigatorMainKey.currentContext ??
              _currentNavigatorKey.currentContext!,
          title: title,
          message: message,
          navigation: this);
      isShowingError = false;
    }
  }

  void onSetCurrentKey(GlobalKey<NavigatorState> key) {
    _currentNavigatorKey = key;
  }

  void popUntil({String? routeMainName, String? routeRootName}) {
    if (routeRootName != null)
      _currentNavigatorKey.currentState?.popUntil((route) {
        return route.isFirst ? true : route.settings.name == routeRootName;
      });
    if (routeMainName != null) {
      navigatorMainKey.currentState?.popUntil((route) {
        return route.isFirst ? true : route.settings.name == routeMainName;
      });
    }
  }

  BuildContext? get context =>
      this.navigatorMainKey.currentContext ??
      _currentNavigatorKey.currentContext;

  void pop() {
    if (navigatorMainKey.currentState?.canPop() ?? false) {
      navigatorMainKey.currentState?.pop();
    } else if (_currentNavigatorKey.currentState?.canPop() ?? false) {
      _currentNavigatorKey.currentState?.pop();
    }
  }

  Future<void> pushReplacement<T>(
    String routeName, {
    Object? arguments,
    String? tag,
    T Function()? creator,
  }) async {
    if (creator != null) {
      Get.put(creator(), tag: tag);
    }
    final navigatorKey = AppRoutes.isMainRoute(routeName)
        ? navigatorMainKey
        : _currentNavigatorKey;
    await navigatorKey.currentState
        ?.pushReplacementNamed(routeName,
            arguments: NavigationArguments(
              arguments: arguments,
              tag: tag,
            ))
        .then((value) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        Get.delete<T>(tag: tag);
      });
      return value;
    });
  }

  Future<dynamic> push<T>(
    String routeName, {
    Object? arguments,
    String? tag,
    T Function()? creator,
  }) async {
    final navigatorKey = AppRoutes.isMainRoute(routeName)
        ? navigatorMainKey
        : _currentNavigatorKey;
    if (creator != null) {
      Get.put(creator(), tag: tag);
    }
    return navigatorKey.currentState
        ?.pushNamed(routeName,
            arguments: NavigationArguments(
              arguments: arguments,
              tag: tag,
            ))
        .then((value) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.delete<T>(tag: tag);
      });
      return value;
    });
  }

  Future<dynamic> pushRemoveUntil<T>(
    String routeName, {
    Object? arguments,
    String? tag,
    T Function()? creator,
  }) async {
    if (creator != null) {
      Get.put(creator(), tag: tag);
    }
    _currentNavigatorKey.currentState?.popUntil((route) => false);
    navigatorMainKey.currentState?.popUntil((route) => false);

    return navigatorMainKey.currentState
        ?.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
    )
        .then((value) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.delete<T>(tag: tag);
      });
    });
  }

  Future<dynamic> showModalBottom<T>(
    Widget widget, {
    Object? arguments,
    String? tag,
    T Function()? creator,
  }) async {
    final context = this.navigatorMainKey.currentContext;
    if (context == null) {
      return;
    }
    if (creator != null) {
      Get.put(creator(), tag: tag);
    }
    return showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.white,
      barrierColor: Colors.white,
      context: context,
      builder: (context) => SafeArea(child: widget),
    ).then((value) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.delete<T>(tag: tag);
      });
      return value;
    });
  }

  Future<void> onShowDialog(String title, String message,
      {bool isConfirm = false, Function? confirmation}) async {
    if (isShowingError) return;
    isShowingError = true;
    await showPlatformDialog(
      context: navigatorMainKey.currentContext!,
      title: title,
      message: message,
      navigation: this,
      isComfirm: isConfirm,
      confirmation: confirmation,
    );
    isShowingError = false;
  }
}
