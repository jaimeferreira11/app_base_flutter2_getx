import 'package:flutter/material.dart';

import '../helpers/responsive.dart';
import 'custom_container_decoration.dart';
import 'custom_labels.dart';
import 'line_separator_widget.dart';

class CustomCard extends StatelessWidget {
  final String? title;
  final Widget child;
  final double? width;
  final double? marginVertical;
  final double? marginHorizontal;
  final Color color;

  const CustomCard(
      {Key? key,
      this.title,
      required this.child,
      this.width,
      this.marginVertical,
      this.color = Colors.white,
      this.marginHorizontal})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(
          horizontal: marginHorizontal ?? responsive.wp(2), vertical: marginVertical ?? responsive.hp(.5)),
      padding: EdgeInsets.all(responsive.dp(.5)),
      decoration: CustomContainerDecoration.card(color: color),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        //  crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            SizedBox(
              height: responsive.hp(1.5),
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: Text(title!, style: CustomLabels.h2),
            ),
            lineSeparator(marginVertical: responsive.hp(1))
          ],
          child
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)]);
}
