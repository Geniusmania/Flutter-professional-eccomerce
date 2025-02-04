 import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

class SearchContainer extends StatelessWidget {
  final IconData? icon;
  final bool showBorder, showBackground;
  final String text;
  const SearchContainer({
    super.key,
    this.icon,
    this.showBorder = true,
    this.showBackground = true,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.spaceBtwSections),
      child: Container(
        padding: const EdgeInsets.all(AppSize.cardRadiusSm),
        decoration: BoxDecoration(
            color: showBackground? dark? AppColors.light : AppColors.dark : Colors.transparent,
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
    );
  }
}
