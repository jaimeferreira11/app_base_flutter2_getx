import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../global_widgets/custom_appbar.dart';
import 'home_controller.dart';
import 'local_widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // GlobalKey bottomNavigationKey = GlobalKey();

    return GetBuilder<HomeController>(
        builder: (_) => SafeArea(
              child: Scaffold(
                appBar: CustomAppBar(
                  titulo: _.title,
                ),
                drawer: const CustomDrawer(),
                body: _.currentPage,
              ),
            ));
  }
}
