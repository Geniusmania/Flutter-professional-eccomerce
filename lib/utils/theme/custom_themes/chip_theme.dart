import 'package:flutter/material.dart';

class GChipTheme{
GChipTheme._();

static ChipThemeData lightChipTheme = ChipThemeData(
  disabledColor: Colors.grey.withOpacity(0.4),
  selectedColor: Colors.blue,
  labelStyle: const TextStyle(color: Colors.black),
  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
  brightness: Brightness.light,
  checkmarkColor: Colors.white,
);



static ChipThemeData darkChipTheme = ChipThemeData(
  disabledColor: Colors.grey.withOpacity(0.4),
  selectedColor: Colors.blue,
  labelStyle: const TextStyle(color: Colors.white),
  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
  brightness: Brightness.dark,
  checkmarkColor: Colors.white,
);
}