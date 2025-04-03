// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../commons/widgets/icon/circular_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ProductQuantityWithAddAndRemoveButton extends StatelessWidget {
  const ProductQuantityWithAddAndRemoveButton({
    Key? key,
     this.remove, this.add, required this.quantity
  }) : super(key: key); 
final VoidCallback? add, remove;
final int quantity;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Row(mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          onPressed: remove,
          icon: Iconsax.minus,
          size: AppSize.md,
          width: 32,
          height: 32,
          color: dark ? AppColors.white : AppColors.black,
          backgroundColor:
          dark ? AppColors.darkergrey : AppColors.light,
        ),const SizedBox(width: 16),
        Text(quantity.toString(),style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: 16),
        CircularIcon(
          onPressed: add,
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
