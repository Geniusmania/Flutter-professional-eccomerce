import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/utils/constants/colors.dart';

class ShoppingCounter extends StatelessWidget {
  final Color iconColor;
  final VoidCallback onPressed;
  const ShoppingCounter({
    super.key, required this.iconColor, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Iconsax.shopping_bag),
          color: iconColor,
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.black.withOpacity(0.5)),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: Colors.white, fontSizeFactor: .9),
              ),
            ),
          ),
        )
      ],
    );
  }
}
