import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';

class AppDecorations {
  static const formStyle = InputDecoration();

  static const buttonStyle = BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
    color: AppColors.primaryColor,
  );
}
