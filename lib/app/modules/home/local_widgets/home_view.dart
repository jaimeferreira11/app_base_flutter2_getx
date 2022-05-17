import 'package:flutter/material.dart';

import '../../../helpers/responsive.dart';
import '../../../theme/fonts.dart';
import 'home_menues_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: responsive.hp(2)),
            child: Text(
              'Medicard',
              style: AppFonts.primaryFont.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: responsive.dp(3.5)),
            ),
          ),
          const HomeMenuesView(),
        ],
      ),
    );
  }
}
