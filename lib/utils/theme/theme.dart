import 'package:flutter/material.dart';
import 'package:ui/utils/theme/custom_themes/appbar_theme.dart';
import 'package:ui/utils/theme/custom_themes/bottom_sheet.dart';
import 'package:ui/utils/theme/custom_themes/chackbox_theme.dart';
import 'package:ui/utils/theme/custom_themes/chip_theme.dart';
import 'package:ui/utils/theme/custom_themes/elevatedbotton_theme.dart';
import 'package:ui/utils/theme/custom_themes/outlined_botton.dart';
import 'package:ui/utils/theme/custom_themes/textFormFiled_theme.dart';
import 'package:ui/utils/theme/custom_themes/text_theme.dart';

class GAppTheme {
  GAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: const Color(0xFF6200EE),
    scaffoldBackgroundColor: Colors.white,
    textTheme:GTextTheme.lightTextTheme,
    elevatedButtonTheme: GElevatedbBottpnTheme.lightElevatedButtonTheme,
    appBarTheme: GAppBar.lightAppBarTheme,
    bottomSheetTheme: GBottonSheetTheme.lightBottomSheetTheme,
    checkboxTheme: GCheckBox.lightCheckBoxTheme,
    chipTheme: GChipTheme.lightChipTheme,
    outlinedButtonTheme: GOutlinedButton.lightOutlinedButtonTheme,
    inputDecorationTheme: GTextFormField.lightInputdecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
     useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF6200EE),
    scaffoldBackgroundColor: Colors.black,
    textTheme:GTextTheme.darkTextTheme,
    elevatedButtonTheme: GElevatedbBottpnTheme.darkElevetedButtonTheme , 
    appBarTheme: GAppBar.darkAppBarTheme,
    bottomSheetTheme: GBottonSheetTheme.darkBottomSheetTheme,
    checkboxTheme: GCheckBox.darkCheckBoxTheme,
    chipTheme: GChipTheme.darkChipTheme,
    outlinedButtonTheme: GOutlinedButton.darkOutlinedButtonTheme,
    inputDecorationTheme: GTextFormField.darkInputdecorationTheme,
  );
}
