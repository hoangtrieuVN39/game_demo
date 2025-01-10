import 'package:app/core/commons.dart';
import 'package:app/features/home/presentation/controllers/home_controller.dart';
import 'package:app/features/home/presentation/view/game_demo.dart';
import 'package:app/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key}) {
    Get.put(HomeViewModel());
  }

  @override
  bool get wrapWithSafeArea => false;

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: GameDemo());
  }
}
