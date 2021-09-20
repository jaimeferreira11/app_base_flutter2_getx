import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'local_widgets/loader_logo.dart';
import 'splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        builder: (_) => const SafeArea(
              child: Scaffold(
                body: LoaderLogo(),
              ),
            ));
  }
}
