import 'package:flutter/material.dart';

class CustomContainerDecoration {
  static BoxDecoration card({
    Color? color,
  }) =>
      BoxDecoration(
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Colors.black54, blurRadius: 2.0, offset: Offset(0.0, 0.25))
        ],
        color: color ?? Colors.white,
        border: Border.all(
          color: Colors.white,
          width: 0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      );
}
