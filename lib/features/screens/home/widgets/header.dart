import 'package:flutter/material.dart';
import 'package:ui/features/screens/home/widgets/bottomCurve.dart';
import 'package:ui/features/screens/home/widgets/circular_container.dart';
import 'package:ui/utils/constants/colors.dart';

class HomeHeaderContainer extends StatelessWidget {
  const HomeHeaderContainer({
    super.key, required this.child,
  });
final Widget child;
  @override
  Widget build(BuildContext context) {
    return CurvedWidget(
      child: Container(
        // padding: const EdgeInsets.all(0),
        // height: 350,
        // width: double.infinity,
        decoration: const BoxDecoration(color: AppColors.primary),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -200,
              child: CircularTransParentCard(
                  color: AppColors.textWhite.withOpacity(0.1),
                  radius: 200),
            ),
            Positioned(
              top: 150,
              right: -250,
              child: CircularTransParentCard(
                  color: AppColors.textWhite.withOpacity(0.1),
                  radius: 200),
            ),
            child
          ],
        ),
      ),
    );
  }
}

