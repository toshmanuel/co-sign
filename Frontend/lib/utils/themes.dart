import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';

class AppTheme {
  static ThemeData defaultTheme = ThemeData(
    cupertinoOverrideTheme:
        const CupertinoThemeData(brightness: Brightness.light),
    cardTheme: const CardTheme(
      margin: EdgeInsets.symmetric(vertical: 1.0),
      elevation: 0,
    ),
    buttonTheme: const ButtonThemeData(
      height: 50.0,
    ),
    textTheme: const TextTheme(
      subtitle1: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      headline6: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w700,
        color: AppColors.blackColor,
        letterSpacing: -0.67,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.blackColor,
      ),
      bodyText2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.blackColor,
      ),
      headline4: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w700,
        color: AppColors.blackColor,
        letterSpacing: -0.67,
      ),
      headline3: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.w700,
        color: AppColors.blackColor,
      ),
    ),
    fontFamily: "Inter",
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.primaryColor,
        onSurface: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme(
      errorStyle: TextStyle(color: AppColors.whiteColor),
      isCollapsed: true,
      fillColor: AppColors.whiteColor,
      filled: true,
      isDense: false,
      hintStyle: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      contentPadding: EdgeInsets.symmetric(vertical: 23, horizontal: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: AppColors.lightNeutral),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightNeutral),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        borderSide: BorderSide(color: AppColors.lightNeutral),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightNeutral, width: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
    ),
  );
}
