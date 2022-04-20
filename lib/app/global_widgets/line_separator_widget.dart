import 'package:flutter/material.dart';

Container lineSeparator(
    {double? marginVertical,
    double? marginHorizontal,
    double height = 1.0,
    Color color = Colors.black12}) {
  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: marginHorizontal ?? 4.0, vertical: marginVertical ?? 0),
    width: double.infinity,
    height: height,
    color: color,
  );
}
