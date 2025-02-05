import 'package:flutter/material.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

class CircularIcon extends StatelessWidget {
  final double? width, height, size;
  final Color? color;
  final IconData icon;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  const CircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = AppSize.lg,
    this.color,
    required this.icon,
    this.backgroundColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color:backgroundColor != null ? backgroundColor!: dark ? AppColors.black.withOpacity(0.9): AppColors.white.withOpacity(0.9) ,
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon, color: color,size: size,)),
    );
  }
}
