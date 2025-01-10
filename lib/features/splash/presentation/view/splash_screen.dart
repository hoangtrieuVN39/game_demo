import 'package:app/core/commons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewmodel/splash_viewmodel.dart';

class SplashScreen extends BaseScreen<SplashViewModel> {
  SplashScreen({super.key}) {
    Get.put(SplashViewModel());
  }

  @override
  bool get wrapWithSafeArea => false;

  @override
  Widget buildScreen(BuildContext context) {
    return const Center(
      child: Icon(Icons.terrain, size: 100),
    );
  }
}
