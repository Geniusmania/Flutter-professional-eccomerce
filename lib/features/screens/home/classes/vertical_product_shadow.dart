import 'package:flutter/material.dart';
import 'package:ui/utils/constants/colors.dart';

class ShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: AppColors.darkgrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );


  static final horizontalProductShadow =BoxShadow(
    color: AppColors.darkgrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset:const Offset(0, 2)

  );
}