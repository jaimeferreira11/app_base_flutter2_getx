import 'package:animate_do/animate_do.dart';
import 'package:app_base_flutter2_getx/app/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/responsive.dart';
import 'login_controller.dart';
import 'widgets_locales/bg_login.dart';
import 'widgets_locales/login_form.dart';

class LoginPage extends StatelessWidget {
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
                          child: Column(
                            children: [
                              Hero(
                                tag: 'login',
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: responsive.hp(3),
                                      bottom: responsive.hp(.5)),
                                  child: const FlutterLogo(
                                    size: 100,
                                  ),
                                ),
                              ),
                              FadeInDown(
                                  child: Center(
                                child: Text(
                                  'App Name',
                                  style: AppFonts.primaryFont.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: responsive.dp(4)),
                                ),
                              )),
                            ],
                          ),
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
                                  ))
                              // Image.asset(
                              //   'assets/images/logo_MB.png',
                              //   height: responsive.hp(10),
                              //   width: double.infinity,
                              // ),
                              ))
                    ],
                  ),
                ),
              ),
            ));
  }
}
