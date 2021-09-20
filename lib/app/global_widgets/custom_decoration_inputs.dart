import 'package:flutter/material.dart';

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
  }) =>
      InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        hintText: hint,
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        labelStyle: TextStyle(color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey),
      );

  static InputDecoration formInputDecoration({
    required String hint,
    required String label,
    IconData? icon,
    InputBorder? border,
  }) =>
      InputDecoration(
          border: border ??
              OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo.withOpacity(.3))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigo.withOpacity(.3))),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey),
          labelStyle: TextStyle(color: Colors.grey),
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
          hintStyle: TextStyle(color: Colors.grey),
          labelStyle: TextStyle(color: Colors.grey),
          labelText: label,
          prefixIcon: icon == null
              ? null
              : Icon(
                  icon,
                  size: 16,
                  color: Colors.grey,
                ));
}
