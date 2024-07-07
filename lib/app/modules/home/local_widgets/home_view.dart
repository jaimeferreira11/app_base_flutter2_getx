import 'package:app_base_flutter2_getx/app/helpers/extensions.dart';
import 'package:app_base_flutter2_getx/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../global_widgets/custom_home_item_widget.dart';
import '../../../helpers/responsive.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Column(
      children: [
        Container(
            color: Colors.grey.shade300,
            padding: EdgeInsets.symmetric(
                horizontal: context.wp(5), vertical: context.hp(2)),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  radius: responsive.dp(3),
                  child: Icon(
                    FontAwesomeIcons.user,
                    color: Colors.white,
                    size: context.dp(2),
                  ),
                ),
                SizedBox(
                  width: context.wp(2),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Usuario',
                      style: context.textTheme.titleLarge,
                    ),
                    Text(
                      'Cod. 6787896',
                      style: context.textTheme.titleMedium,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Estudio'),
                    FilledButton.icon(
                        onPressed: () {}, label: const Text('123123'))
                  ],
                )
              ],
            )),
        Table(
          children: [
            TableRow(
              children: [
                CustomHomeItemWidget(
                  isVertical: false,
                  icon: Icon(
                    FontAwesomeIcons.penToSquare,
                    size: responsive.dp(2),
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
        ),
      ],
    );
  }
}
