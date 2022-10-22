import 'package:flutter/material.dart';

import '../helpers/responsive.dart';
import '../theme/colors.dart';
import '../theme/fonts.dart';

class WarningView extends StatelessWidget {
  final String text;
  final bool isButtonRequired;
  final String? buttonText;
  final Function? onButtonPressed;
  const WarningView(
      {Key? key, required this.text, required this.isButtonRequired, this.buttonText, this.onButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    var textStyleAudiencia2 = TextStyle(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w700,
      fontSize: responsive.dp(2.5),
    );

    var textStyleLightButton = AppFonts.secondaryFont.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: responsive.dp(2.2),
    );

    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 30, left: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Spacer(
                  flex: 2,
                ),
                Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        ClipOval(
                          child: SizedBox(
                              //  color: Colors.white,
                              height: responsive.hp(20),
                              child: Image.asset('assets/images/ic_launcher.png')
                              /* SvgPicture.asset(
                                  'assets/images/beneficios/cine/sinfunciones.svg'),*/
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Material(
                  color: Colors.transparent,
                  child: Text(
                    text,
                    style: textStyleAudiencia2,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                isButtonRequired
                    ? MaterialButton(
                        elevation: 5.0,
                        color: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: isButtonRequired ? () => onButtonPressed!() : null,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 60.0,
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                buttonText!,
                                style: textStyleLightButton,
                              )
                            ],
                          ),
                        ),
                      )
                    : Container(),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
          Visibility(
            visible: false,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
