import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  //app colors
  static const Color primary = Color(0xff4b68ff);
  static const Color secondry = Color(0xffffe34b);
  static const Color accent = Color(0xffb0c7ff);

  //gredient Colors

  static const Gradient primaryGradient = LinearGradient(
    colors: [Color(0xffff9a9e), Color(0xfffad0c4), Color(0xfffad0c4)],
    begin: Alignment(0, 0),
    end: Alignment(0.707, -0.707),
  );

//text colors;
  static const Color textPrimary = Color(0xff333333);
  static const Color textSecondry = Color(0xff6c757d);
  static const Color textWhite = Colors.white;

  //background colors
  static const Color light = Color(0xff272727);
  static const Color dark = Color(0xfff6f6f6);
  static const Color primaryBackgroung = Color(0xfff3f5ff);

  //background container colors
  static const Color lightContainer = Color(0xfff6f6f6);
  static Color darkContainer =
      const Color.fromARGB(255, 46, 46, 46).withValues(alpha: 200);

  //Button colors
  static const Color buttonPrimary = Color(0xff4b68ff);
  static const Color buttonSecondary = Color(0xff6c7570);
  static const Color buttonDisabled = Color(0xffc4c4c4);

  //Border Colors
  static const Color borderPrimary = Color(0xffd9d9d9);
  static const Color borderSecondary = Color(0xffd9d9d9);

  //Error and validation Colors
  static const Color error = Color(0xffd32f2f);
  static const Color success = Color(0xff399e3c);
  static const Color warning = Color(0xfff57c00);
  static const Color info = Color(0xff1976d2);

  //neutral shades
  static const Color black = Color(0xff232323);
  static const Color darkergrey = Color(0xff4f4f4f);
  static const Color darkgrey = Color(0xff939393);
  static const Color grey = Color(0xffe0e0e0);
  static const Color softgrey = Color(0xfff4f4f4);
  static const Color lightgrey = Color(0xfff9f9f9);
  static const Color white = Color(0xffffffff);
}
