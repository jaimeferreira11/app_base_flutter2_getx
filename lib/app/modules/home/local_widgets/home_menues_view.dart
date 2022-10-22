import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../global_widgets/custom_home_item_widget.dart';
import '../../../helpers/responsive.dart';
import '../../../routes/app_routes.dart';

class HomeMenuesView extends StatelessWidget {
  const HomeMenuesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Table(
      children: [
        TableRow(
          children: [
            CustomHomeItemWidget(
              isVertical: false,
              icon: Icon(
                FontAwesomeIcons.penToSquare,
                size: responsive.dp(3),
                color: Colors.white,
              ),
              route: "",
              title: 'Miasdasd',
            ),
          ],
        ),
        TableRow(
          children: [
            CustomHomeItemWidget(
              icon: Icon(
                FontAwesomeIcons.penToSquare,
                size: responsive.dp(3),
                color: Colors.white,
              ),
              route: "",
              title: 'AAAAAAA',
            ),
          ],
        )
      ],
    );
  }
}
