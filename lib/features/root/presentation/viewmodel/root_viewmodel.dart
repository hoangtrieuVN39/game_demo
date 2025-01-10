import 'package:app/core/commons.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RootViewModel extends BaseViewModel {
  var currentTabIndex = 0.obs;
  late CupertinoTabController tabController;

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void changeTab(int to) {
    tabController.index = to;
    currentTabIndex.value = to;
  }

  void _initialize() {
    tabController =
        CupertinoTabController(initialIndex: RootTabEnum.home.index);
    currentTabIndex.value = 0;
  }
}
