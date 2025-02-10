 import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/devices/device_utility.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

class SearchContainer extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? icon;
  final bool showBorder, showBackground;
  final EdgeInsetsGeometry padding;
  final String text;
  const SearchContainer({
    super.key,
    this.icon,
    this.showBorder = true,
    this.showBackground = true,
    required this.text, this.onTap,  this.padding =  const EdgeInsets.symmetric(horizontal: AppSize.spaceBtwSections),
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:padding,
        child: Container(
          width: DeviceUtility.getScreenWidth(),
          padding: const EdgeInsets.all(AppSize.cardRadiusSm),
          decoration: BoxDecoration(
              color: showBackground? dark? AppColors.dark : AppColors.light : Colors.transparent,
              borderRadius: BorderRadius.circular(AppSize.cardRadiusLg),
              border:showBorder? Border.all(color: AppColors.darkgrey): null),
          child: Row(
            children: [
              Icon(Iconsax.search_normal, color: dark? AppColors.white: AppColors.grey,),
              const SizedBox(width: AppSize.spaceBtwTtems),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall!.apply(color: dark? Colors.white: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
