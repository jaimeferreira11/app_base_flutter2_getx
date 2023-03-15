// ignore_for_file: unnecessary_this

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../helpers/responsive.dart';
import '../theme/colors.dart';
import '../theme/fonts.dart';

class CustomIconButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final bool isFilled;
  final IconData? icon;
  final bool enabled;
  final double? fontSize;
  final double? paddingHorizontal;
  final bool isLoading;
  final String textIsLoading;

  const CustomIconButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.color = AppColors.primaryColor,
      this.isFilled = false,
      this.enabled = true,
      this.fontSize = 18,
      this.paddingHorizontal = 30,
      this.isLoading = false,
      this.textIsLoading = "Procesando",
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return OutlinedButton(
        onPressed: !enabled
            ? null
            : isLoading
                ? null
                : () => onPressed(),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: paddingHorizontal!)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // <-- Radius
          )),
          side: enabled ? MaterialStateProperty.all(BorderSide(color: color)) : null,
          backgroundColor: MaterialStateProperty.all(enabled
              ? isFilled
                  ? color
                  : Colors.white
              : Colors.grey[100]),
          overlayColor: MaterialStateProperty.all(color.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? SpinKitWave(
                    color: isFilled ? Colors.white : Colors.orangeAccent,
                    type: SpinKitWaveType.end,
                    size: 24.0,
                  )
                : Icon(
                    icon,
                    color: enabled
                        ? this.isFilled
                            ? Colors.white
                            : this.color
                        : Colors.grey[600],
                  ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  Text(
                    isLoading ? textIsLoading : text,
                    textAlign: TextAlign.center,
                    style: AppFonts.secondaryFont.copyWith(
                      fontSize: fontSize ?? responsive.dp(2),
                      color: enabled
                          ? this.isFilled
                              ? Colors.white
                              : this.color
                          : Colors.grey[600],
                    ),
                  ),
                  isLoading
                      ? AnimatedTextKit(isRepeatingAnimation: true, repeatForever: true, animatedTexts: [
                          TyperAnimatedText('...',
                              textStyle: AppFonts.secondaryFont.copyWith(
                                fontSize: fontSize ?? responsive.dp(2),
                                color: enabled
                                    ? this.isFilled
                                        ? Colors.white
                                        : this.color
                                    : Colors.grey[600],
                              ),
                              speed: const Duration(milliseconds: 200)),
                        ])
                      : Container()
                ],
              ),
            )
          ],
        ));
  }
}
