import 'package:flutter/material.dart';
import 'package:ui/features/screens/home/widgets/curverd_clipper.dart';

class CurvedWidget extends StatelessWidget {
  const CurvedWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: const CustomShapeClipper(),
      child: child,
    );
  }
}
