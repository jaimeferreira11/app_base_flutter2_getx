import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../helpers/responsive.dart';
import '../../../theme/colors.dart';
import '../../../theme/fonts.dart';
import '../login_controller.dart';

class FormularioSendButton extends StatelessWidget {
  const FormularioSendButton({
    Key? key,
    required this.loginController,
    required this.form,
    required this.funcion,
    required this.height,
    required this.width,
    required this.ignore,
    required this.text,
    //this.profileController,
  }) : super(key: key);

  final LoginController loginController;
  //final ProfileController profileController;
  final FormGroup form;
  final Function funcion;
  final double height;
  final double width;
  final RxBool ignore;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
          elevation: 5.0,
          color: form.valid
              ? AppColors.primaryColor
              : Colors.blueGrey.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // <-- Radius
          ),
          child: _LoginButtonChild(
            controller: loginController,
            ignore: ignore,
            text: text,
          ),
          onPressed: form.valid ? () => funcion() : () {}),
    );
  }
}

class _LoginButtonChild extends StatelessWidget {
  const _LoginButtonChild(
      {required this.controller, required this.ignore, required this.text});

  final LoginController controller;
  final RxBool ignore;
  final String text;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Obx(
        () => ignore.value
            ? const CircularProgressIndicator(
                backgroundColor: Colors.white,
              )
            : Text(
                text,
                style: AppFonts.secondaryFont.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: responsive.dp(2)),
              ),
      ),
    );
  }
}
