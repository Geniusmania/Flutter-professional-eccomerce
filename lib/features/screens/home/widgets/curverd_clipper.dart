import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  const CustomShapeClipper();

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
final initialCurvePoint = Offset(0, size.height-20);
final last1CurvePoint = Offset(30, size.height-20);
path.quadraticBezierTo(initialCurvePoint.dx, initialCurvePoint.dy, last1CurvePoint.dx, last1CurvePoint.dy);


final firstlinePoint = Offset(0, size.height-20);
final lastlinePoint = Offset(size.width-30, size.height-20);
path.quadraticBezierTo(firstlinePoint.dx, firstlinePoint.dy, lastlinePoint.dx, lastlinePoint.dy);

final lastCurvePoint = Offset(size.width, size.height-20);
final last2CurvePoint = Offset(size.width, size.height);
path.quadraticBezierTo(lastCurvePoint.dx, lastCurvePoint.dy, last2CurvePoint.dx, last2CurvePoint.dy);


path.lineTo(size.width, 0);
   
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}