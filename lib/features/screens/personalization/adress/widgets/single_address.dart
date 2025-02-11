import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/commons/widgets/roudedContainer/rounded_container.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});
final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return RoundedContainer(
      padding: const EdgeInsets.all(AppSize.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress? AppColors.primary.withOpacity(0.5): Colors.transparent,
      borderColor: selectedAddress? Colors.transparent: dark? AppColors.darkergrey: AppColors.grey,
      margin: const EdgeInsets.only(bottom: AppSize.spaceBtwTtems),
      child: Stack(children: [
        Positioned(
          top: 0,
          right: 5,
          child: Icon(
            selectedAddress? Iconsax.tick_circle5: null,color: selectedAddress? dark? AppColors.light: AppColors.dark.withOpacity(0.6):null
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Genius Mania',maxLines: 1,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.titleLarge),
         const SizedBox(height: AppSize.sm/2),
            const Text('(+233) 59 660 5771',maxLines: 1,overflow: TextOverflow.ellipsis),
            const SizedBox(height: AppSize.sm/2),
            const Text(' East Legon, Accra, American House, Ghana', softWrap: true,maxLines: 1,)

          ],
        )
      ],),
    );
  }
}
