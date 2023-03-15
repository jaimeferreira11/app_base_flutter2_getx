import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../helpers/responsive.dart';
import '../theme/fonts.dart';

class CustomLabels {
  static TextStyle h1 =
      AppFonts.primaryFont.copyWith(fontSize: Responsive.of(Get.context!).dp(1.9), fontWeight: FontWeight.w500);

  static TextStyle h2 =
      AppFonts.primaryFont.copyWith(fontSize: Responsive.of(Get.context!).dp(1.7), fontWeight: FontWeight.w400);
}
