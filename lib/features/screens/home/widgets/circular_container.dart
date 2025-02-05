import 'package:flutter/material.dart';

class CircularTransParentCard extends StatelessWidget {
  final double? height;
  final EdgeInsets? margin;

  final double? width;
  final Color? color;
  final double? radius;

  final Widget? child;

  const CircularTransParentCard({
    super.key,
    this.height = 400,
    this.width = 400,
    this.color = Colors.white,
    this.radius = 400,
    this.child, this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius!)),
      child: child,
    );
  }
}