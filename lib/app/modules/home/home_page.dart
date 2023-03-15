import 'package:fancy_bottom_navigation_2/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../global_widgets/custom_appbar.dart';
import '../../theme/colors.dart';
import 'home_controller.dart';
import 'local_widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey bottomNavigationKey = GlobalKey();

    return GetBuilder<HomeController>(
        builder: (_) => SafeArea(
              child: Scaffold(
                appBar: CustomAppBar(
                  titulo: _.title,
                ),
                bottomNavigationBar: FancyBottomNavigation(
                  circleColor: AppColors.primaryColor,
                  inactiveIconColor: AppColors.secondaryColor,
                  tabs: [
                    TabData(iconData: FontAwesomeIcons.motorcycle, title: "Asignaciones", onclick: () {}),
                    TabData(iconData: FontAwesomeIcons.timeline, title: "Histórico"),
                  ],
                  initialSelection: _.currentIndex.value,
                  key: bottomNavigationKey,
                  onTabChangedListener: _.changePage,
                ),
                drawer: const CustomDrawer(),
                body: _.currentPage,
              ),
            ));
  }
}
