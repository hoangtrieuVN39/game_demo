import 'package:app/core/commons.dart';
import 'package:app/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseScreen<T extends GetxController> extends GetView<T> {
  BaseScreen({Key? key, this.screenTag}) : super(key: key);
  final AppNavigation navigation = Get.find();
  String? screenTag;

  @override
  Widget build(BuildContext context) {
    if (screenTag == null) {
      screenTag = getArguments(context)?.tag;
    }
    return Container(
      color: unSafeAreaColor(context),
      child: Stack(
        children: [
          Container(
              color: screenBackgroundColor(context) ?? Colors.transparent),
          if (buildBackgroundImage(context) != null)
            buildBackgroundImage(context)!,
          Scaffold(
            extendBody: extendBodyBehindAppBar,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            appBar: buildAppBar(context),
            body: wrapWithSafeArea
                ? SafeArea(
                    top: setTopSafeArea,
                    bottom: setBottomSafeArea,
                    child: buildScreen(context),
                  )
                : buildScreen(context),
            backgroundColor: buildBackgroundImage(context) != null
                ? Colors.transparent
                : screenBackgroundColor(context),
          ),
        ],
      ),
    );
  }

  @protected
  Color? unSafeAreaColor(BuildContext context) =>
      Theme.of(context).colorScheme.unSafeAreaColor;

  @protected
  bool get resizeToAvoidBottomInset => true;

  @protected
  bool get extendBodyBehindAppBar => false;

  @protected
  Color? screenBackgroundColor(BuildContext context) =>
      Theme.of(context).colorScheme.backgroundColor;

  @protected
  Widget buildScreen(BuildContext context);

  @protected
  Widget? buildBackgroundImage(BuildContext context) => null;

  @protected
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @protected
  bool get wrapWithSafeArea => true;

  @protected
  bool get setBottomSafeArea => true;

  @protected
  bool get setTopSafeArea => true;

  @protected
  T get controller => Get.find<T>(tag: screenTag);

  @protected
  NavigationArguments? getArguments(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as NavigationArguments?;
    return arguments;
  }
}
