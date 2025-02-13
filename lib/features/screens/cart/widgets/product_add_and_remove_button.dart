import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../commons/widgets/icon/circular_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ProductQuantityWithAddAndRemoveButton extends StatelessWidget {
  const ProductQuantityWithAddAndRemoveButton({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Row(mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          icon: Iconsax.minus,
          size: AppSize.md,
          width: 32,
          height: 32,
          color: dark ? AppColors.white : AppColors.black,
          backgroundColor:
          dark ? AppColors.darkergrey : AppColors.light,
        ),const SizedBox(width: 16),
        Text('2',style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: 16),
        CircularIcon(
            icon: Iconsax.add,
            size: AppSize.md,
            width: 32,
            height: 32,
            color: dark ? AppColors.white : AppColors.black,
            backgroundColor:
            AppColors.primary
        ),
      ],
    );
  }
}