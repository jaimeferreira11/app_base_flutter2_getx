import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../helpers/responsive.dart';
import '../modules/home/home_controller.dart';
import '../theme/colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? titulo;
  final bool? showLogOutButton;

  CustomAppBar({Key? key, this.titulo, this.showLogOutButton = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return GetBuilder<HomeController>(
        builder: (_) => AppBar(
              backgroundColor: AppColors.secondaryColor,
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
                  : Text(titulo!),
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
