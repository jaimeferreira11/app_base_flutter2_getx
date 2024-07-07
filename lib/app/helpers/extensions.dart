import 'dart:math' as math;

import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  double get sizeWidth => MediaQuery.of(this).size.width;

  double get sizeHeight => MediaQuery.of(this).size.height;

  double get sizeDialgonal =>
      math.sqrt(math.pow(MediaQuery.of(this).size.width, 2) +
          math.pow(MediaQuery.of(this).size.height, 2));

  double wp(double percent) => sizeWidth * percent / 100;
  double hp(double percent) => sizeHeight * percent / 100;
  double dp(double percent) => sizeDialgonal * percent / 100;
}
