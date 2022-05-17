import 'package:cool_stepper/cool_stepper.dart';
import 'package:flutter/material.dart';

import '../helpers/responsive.dart';
import '../theme/fonts.dart';

class CustomStepperView extends StatelessWidget {
  final CoolStep step;
  final VoidCallback? onStepNext;
  final VoidCallback? onStepBack;

  const CustomStepperView({
    Key? key,
    required this.step,
    this.onStepNext,
    this.onStepBack,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final title = Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
            SizedBox(
              width: responsive.wp(80),
              child: Text(
                step.title.toUpperCase(),
                style: AppFonts.primaryFont.copyWith(
                  fontSize: responsive.dp(1.6),
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                maxLines: 2,
              ),
            ),
          ]),
          SizedBox(height: responsive.hp(1)),
          Text(
            step.subtitle,
            style: AppFonts.secondaryFont.copyWith(
              fontSize: responsive.dp(1.5),
              fontWeight: FontWeight.w600,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );

    final content = Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: step.content,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [title, content],
    );
  }
}
