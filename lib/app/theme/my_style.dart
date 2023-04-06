import 'package:flutter/material.dart';

import '../helpers/responsive.dart';
import 'fonts.dart';

class MyStyle {
  static TextStyle title(BuildContext context) {
    final responsive = Responsive.of(context);
    return AppFonts.primaryFont
        .copyWith(color: Colors.black87, fontWeight: FontWeight.w700, fontSize: responsive.dp(1.8));
  }
}
