import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';

import '../../../helpers/responsive.dart';
import '../../../theme/colors.dart';
import '../../../theme/fonts.dart';

class LoaderLogo extends StatelessWidget {
  const LoaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [AppColors.primaryColor, AppColors.darkColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 0.7],
          )),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  ZoomIn(
                      delay: const Duration(milliseconds: 800),
                      child: const Hero(
                        tag: 'login',
                        child: FlutterLogo(size: 200),
                      )),
                  SizedBox(
                    height: responsive.hp(2),
                  ),
                  ZoomIn(
                      delay: const Duration(milliseconds: 800),
                      child: Center(
                        child: Text(
                          '',
                          style: AppFonts.primaryFont.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: responsive.dp(5)),
                        ),
                      )),
                  const Spacer(
                    flex: 1,
                  ),
                  const CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 5,
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  // BounceInUp(
                  //     delay: const Duration(milliseconds: 1000),
                  //     child: Container(
                  //       margin: EdgeInsets.only(bottom: responsive.hp(1)),
                  //       child: Image(
                  //         height: responsive.hp(7),
                  //         image: const AssetImage(
                  //           'assets/images/logo_fp_blanco.png',
                  //         ),
                  //       ),
                  //     )),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
