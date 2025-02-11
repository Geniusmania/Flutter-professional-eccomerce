import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/commons/widgets/icon/circular_icon.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/helpers/helper_functions.dart';
import '../../../../utils/constants/colors.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSize.deafaultspace,
          vertical: AppSize.deafaultspace / 2),
      decoration: BoxDecoration(
          color: dark ? AppColors.darkergrey : AppColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSize.cardRadiusLg),
            topRight: Radius.circular(AppSize.cardRadiusLg),
          )),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircularIcon(
                icon: Iconsax.minus,
                width: 40,
                height: 40,
                color: AppColors.white,
                backgroundColor: AppColors.darkgrey,
              ),
              const SizedBox(width: AppSize.spaceBtwTtems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: AppSize.spaceBtwTtems),
              const CircularIcon(
                  icon: Iconsax.add,
                  width: 40,
                  height: 40,
                  color: AppColors.white,
                  backgroundColor: AppColors.black),
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),backgroundColor: AppColors.black),

              child: const Text('Add to Cart'))
        ],
      ),
    );
  }
}
