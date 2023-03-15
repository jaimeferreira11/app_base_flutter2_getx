import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_widgets/avatar_button.dart';
import '../../../helpers/responsive.dart';
import '../../../theme/colors.dart';
import '../home_controller.dart';

class CustomDrawer extends GetView<HomeController> {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    List<Widget> drawerOptions = [];
    for (var i = 0; i < controller.drawerItems.length; i++) {
      var d = controller.drawerItems[i];
      var selected = i == controller.selectedDrawerIndex;
      drawerOptions.add(ListTile(
        leading: Icon(d.icon, size: responsive.dp(2), color: selected ? AppColors.primaryColor : Colors.black54),
        title: Text(
          d.title,
          style: TextStyle(
              fontSize: responsive.dp(1.8),
              fontWeight: selected ? FontWeight.w500 : FontWeight.w400,
              color: selected ? AppColors.primaryColor : Colors.black54),
        ),
        selected: selected,
        onTap: () => controller.onSelectItem(i),
      ));
    }

    return Container(
      color: Colors.white,
      width: responsive.wp(70),
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
            margin: const EdgeInsets.all(0),
            currentAccountPictureSize: const Size.square(85.0),
            accountName: Text(
              "Usuario",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: responsive.dp(1.6),
                  fontStyle: FontStyle.italic),
            ),
            accountEmail: Text(
              'username',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: responsive.dp(1.5),
              ),
            ),
            currentAccountPicture: AvatarButton(
              imageSize: 200,
              onPressed: () {},
              path: 'assets/images/user.png',
            ),
          ),
          Column(children: drawerOptions),
          const Divider(),
          const Center(
              child: Text(
            'v1.0.0',
            style: TextStyle(color: Colors.black54),
          ))
        ],
      ),
    );
  }
}

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}
