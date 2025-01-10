import 'package:app/core/commons.dart';
import 'package:app/core/routes.dart';
import 'package:app/core/utils.dart';
import 'package:app/features/home/presentation/view/home_screen.dart';
import 'package:app/gen/fonts.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewmodel/root_viewmodel.dart';

class TabItem {
  TabItem({required this.inActiveIcon, required this.type});
  final IconData inActiveIcon;
  final RootTabEnum type;
}

class RootScreen extends BaseScreen<RootViewModel> {
  RootScreen({Key? key}) : super(key: key) {
    Get.put(RootViewModel());
    navigation
        .onSetCurrentKey(navigatorRootKeys[controller.currentTabIndex.value]);
  }
  final List<TabItem> tabItems = [
    TabItem(
      inActiveIcon: Icons.home,
      type: RootTabEnum.home,
    ),
    TabItem(
      inActiveIcon: Icons.list,
      type: RootTabEnum.list,
    ),
    TabItem(
      inActiveIcon: Icons.person,
      type: RootTabEnum.profile,
    ),
  ];

  final List<GlobalKey<NavigatorState>> navigatorRootKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  bool get setTopSafeArea => false;

  @override
  Widget buildScreen(BuildContext context) {
    return CupertinoTabScaffold(
      controller: controller.tabController,
      resizeToAvoidBottomInset: false,
      tabBar: CupertinoTabBar(
        border: const Border(top: BorderSide.none),
        items: tabItems.map((tabItem) {
          return BottomNavigationBarItem(
            icon: Obx(() => _buildIconWithLabel(
                  context,
                  controller.currentTabIndex.value == tabItems.indexOf(tabItem),
                  tabItem,
                )),
          );
        }).toList(),
        backgroundColor: Theme.of(context).colorScheme.backgroundColor,
        currentIndex: controller.currentTabIndex.value,
        onTap: (index) {
          if (index != controller.currentTabIndex.value) {
            navigation.onSetCurrentKey(navigatorRootKeys[index]);
            controller.changeTab(index);
          } else {
            navigatorRootKeys[index]
                .currentState
                ?.popUntil((route) => route.isFirst);
          }
        },
      ),
      tabBuilder: (_, index) {
        return CupertinoTabView(
          navigatorKey: navigatorRootKeys[index],
          routes: AppRoutes.getRootRoutes(),
          builder: (context) {
            switch (tabItems[index].type) {
              case RootTabEnum.home:
                return HomeScreen();
              case RootTabEnum.list:
                return Container(
                  child: const Center(child: Text('List')),
                );
              case RootTabEnum.profile:
                return Container(
                  child: const Center(child: Text('Profile')),
                );
            }
          },
        );
      },
    );
  }

  Widget _buildIconWithLabel(
      BuildContext context, bool isActive, TabItem tabItem) {
    return Transform.translate(
      offset: const Offset(0, 8),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              size: 24,
              tabItem.inActiveIcon,
              color: isActive
                  ? Theme.of(context).colorScheme.activeBottomNavColor
                  : Theme.of(context).colorScheme.inactiveBottomNavColor,
            ),
            Text(
              tabItem.type.title,
              style: TextStyle(
                  fontFamily: FontFamily.hiraginoKakuGothicPro,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isActive
                      ? Theme.of(context).colorScheme.activeBottomNavColor
                      : Theme.of(context).colorScheme.inactiveBottomNavColor),
            ),
          ],
        ),
      ),
    );
  }
}
