import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../helpers/responsive.dart';
import '../theme/colors.dart';
import '../theme/fonts.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      margin: EdgeInsets.only(top: responsive.hp(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.folderOpen, size: responsive.dp(5), color: AppColors.secondaryColor),
          SizedBox(
            height: responsive.hp(2),
          ),
          Text(
            'Sin registros que mostrar',
            style: AppFonts.primaryFont
                .copyWith(fontSize: responsive.dp(2.2), color: AppColors.secondaryColor, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
