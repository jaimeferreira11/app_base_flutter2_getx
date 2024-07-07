import 'package:fancy_bottom_navigation_2/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../global_widgets/custom_appbar.dart';
import '../../theme/colors.dart';
import 'home_controller.dart';
import 'local_widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey bottomNavigationKey = GlobalKey();

    return GetBuilder<HomeController>(
        builder: (controller) => SafeArea(
              child: PopScope(
                onPopInvoked: controller.onWillPop,
                child: Scaffold(
                  appBar: CustomAppBar(
                    titulo: controller.title,
                  ),
                  bottomNavigationBar: FancyBottomNavigation(
                    circleColor: AppColors.primaryColor,
                    inactiveIconColor: AppColors.secondaryColor,
                    tabs: [
                      TabData(
                          iconData: FontAwesomeIcons.house,
                          title: "Inicio",
                          onclick: () {}),
                      TabData(
                          iconData: FontAwesomeIcons.squarePlus,
                          title: "Auditar"),
                      TabData(
                          iconData: FontAwesomeIcons.folderTree,
                          title: "Realizados"),
                      TabData(
                          iconData: FontAwesomeIcons.gear, title: "Ajustes"),
                    ],
                    initialSelection: controller.currentIndex.value,
                    key: bottomNavigationKey,
                    onTabChangedListener: controller.changePage,
                  ),
                  drawer: const CustomDrawer(),
                  body: controller.currentPage,
                ),
              ),
            ));
  }
}
