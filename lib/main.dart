import 'package:app/core/commons.dart';
import 'package:app/core/constants.dart';
import 'package:app/core/routes.dart';
import 'package:app/core/utils.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/features/home/bindings/home_binding.dart';
import 'package:app/core/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setPortrait();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppNavigation navigation = Get.put(AppNavigation());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.theme(),
      navigatorKey: navigation.navigatorMainKey,
      initialRoute: AppPages.initialPage(),
      getPages: AppPages.getPages,
    );
  }
}
