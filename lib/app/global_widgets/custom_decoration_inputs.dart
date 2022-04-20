import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CustomDecorationInputs {
  static InputDecoration loginInputDecoration({
    required String hint,
    required String label,
    IconData? icon,
  }) =>
      InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white.withOpacity(.3))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white.withOpacity(.3))),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          labelStyle: const TextStyle(color: Colors.grey),
          labelText: label,
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ));

  static InputDecoration searchInputDecoration({
    required String hint,
    required IconData icon,
    IconButton? suffixIcon,
  }) =>
      InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: AppColors.inputColor)),
          // enabledBorder: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          labelStyle: const TextStyle(color: Colors.grey),
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: suffixIcon);

  static InputDecoration formInputDecoration({
    required String hint,
    required String label,
    IconData? icon,
    InputBorder? border,
    double? fontSize,
  }) =>
      InputDecoration(
          border: border ??
              OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo.withOpacity(.3))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigo.withOpacity(.3))),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          labelStyle: TextStyle(color: Colors.grey, fontSize: fontSize),
          labelText: label,
          prefixIcon: icon == null
              ? null
              : Icon(
                  icon,
                  size: 16,
                  color: Colors.grey,
                ));

  static InputDecoration formSelectDecoration({
    required String label,
    IconData? icon,
  }) =>
      InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigo.withOpacity(.3))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigo.withOpacity(.3))),
          hintStyle: const TextStyle(color: Colors.grey),
          labelStyle: const TextStyle(color: Colors.grey),
          labelText: label,
          prefixIcon: icon == null
              ? null
              : Icon(
                  icon,
                  size: 16,
                  color: Colors.grey,
                ));
}
