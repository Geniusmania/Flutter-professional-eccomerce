import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

class ShoppingCounter extends StatelessWidget {
  final Color iconColor;
  final VoidCallback onPressed;
  const ShoppingCounter({
    super.key,  this.iconColor = Colors.white, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final dark =HelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Iconsax.shopping_bag),
          color:dark ? iconColor: AppColors.dark,
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:dark? AppColors.white: AppColors.black.withOpacity(0.5)),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color:dark?Colors.black:  Colors.white, fontSizeFactor: .9),
              ),
            ),
          ),
        )
      ],
    );
  }
}
