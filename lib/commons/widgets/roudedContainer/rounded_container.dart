import 'package:flutter/material.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/constants/sizes.dart';

class RoundedContainer extends StatelessWidget {
  final Widget? child;
  final double? height, width;
  final double radius;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const RoundedContainer(
      {super.key,
      this.height,
      this.width,
      this.radius = AppSize.cardRadiusLg,
      this.showBorder = false,
      this.borderColor = AppColors.borderPrimary,
      this.backgroundColor = AppColors.white,
      this.padding,
      this.margin,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
