import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../routes/app_routes.dart';
import 'menu_button_widget.dart';

class HomeMenuesView extends StatelessWidget {
  const HomeMenuesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(children: [
          MenuButtonWidget(
              vertical: false,
              icon: FontAwesomeIcons.penToSquare,
              text: 'Registrar datos',
              route: AppRoutes.registroDatos),
        ])
      ],
    );
  }
}
