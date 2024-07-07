import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../modules/home/home_controller.dart';
import '../theme/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titulo;
  final bool? showLogOutButton;

  const CustomAppBar({super.key, this.titulo, this.showLogOutButton = true});

  @override
  Widget build(BuildContext context) {
    // final responsive = Responsive.of(context);
    return GetBuilder<HomeController>(
        builder: (_) => AppBar(
              backgroundColor: AppColors.darkColor,
              title: titulo == null
                  ? Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: const Hero(tag: 'login', child: FlutterLogo()
                          // Image.asset(
                          //   'assets/images/heroes.png',
                          //   height: responsive.hp(5),
                          //   width: double.infinity,
                          // ),
                          ))
                  : Text(
                      titulo!,
                      style: const TextStyle(color: Colors.white),
                    ),
              centerTitle: true,
              actions: showLogOutButton!
                  ? [
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: IconButton(
                            onPressed: () => _.launchDialogCerrarSesion(),
                            icon: const Icon(Icons.exit_to_app)),
                      ),
                    ]
                  : [],
            ));
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height * 1.1);
}
