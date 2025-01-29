import 'package:flutter/material.dart';

class GBottonSheetTheme{
  GBottonSheetTheme._();

static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
 showDragHandle: true,
 backgroundColor: Colors.white,
 modalBackgroundColor: Colors.white,
 constraints: const BoxConstraints(minHeight: double.infinity),
 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
);

static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
 showDragHandle: true,
 backgroundColor: Colors.white,
 modalBackgroundColor: Colors.white,
 constraints: const BoxConstraints(minHeight: double.infinity),
 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
);



}