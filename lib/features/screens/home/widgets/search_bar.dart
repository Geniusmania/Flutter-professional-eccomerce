 import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

class SearchContainer extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? icon;
  final bool showBorder, showBackground;
  final String text;
  const SearchContainer({
    super.key,
    this.icon,
    this.showBorder = true,
    this.showBackground = true,
    required this.text, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.spaceBtwSections),
        child: Container(
          padding: const EdgeInsets.all(AppSize.cardRadiusSm),
          decoration: BoxDecoration(
              color: showBackground? dark? AppColors.dark : AppColors.light : Colors.transparent,
              borderRadius: BorderRadius.circular(AppSize.cardRadiusLg),
              border:showBorder? Border.all(color: AppColors.darkgrey): null),
          child: Row(
            children: [
              const Icon(Iconsax.search_normal),
              const SizedBox(width: AppSize.deafaultspace),
              Text(
                text,
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
