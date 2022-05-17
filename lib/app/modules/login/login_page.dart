import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/responsive.dart';
import '../../theme/fonts.dart';
import 'login_controller.dart';
import 'widgets_locales/bg_login.dart';
import 'widgets_locales/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return GetBuilder<LoginController>(
        builder: (_) => SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.grey[200],
                body: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      const BackgroundLogin3(),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: FadeInDown(
                              child: Container(
                            margin: EdgeInsets.only(top: responsive.hp(10)),
                            child: Text(
                              'Medicard',
                              style: AppFonts.primaryFont.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: responsive.dp(4)),
                            ),
                          )),
                        ),
                      ),
                      const Positioned.fill(
                          child: Align(
                              alignment: Alignment.center, child: LoginForm())),
                      Positioned.fill(
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  margin:
                                      EdgeInsets.only(bottom: responsive.hp(1)),
                                  child: Text(
                                    'Arasa IT © 2022',
                                    style: AppFonts.secondaryFont.copyWith(
                                        fontSize: responsive.dp(1.8),
                                        fontWeight: FontWeight.bold),
                                  ))))
                    ],
                  ),
                ),
              ),
            ));
  }
}
