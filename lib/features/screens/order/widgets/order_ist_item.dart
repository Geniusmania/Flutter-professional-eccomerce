import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/commons/widgets/roudedContainer/rounded_container.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/sizes.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return ListView.separated(

      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (_,__)=> const SizedBox(height: AppSize.spaceBtwTtems),
      itemBuilder: (_, index)=>
      RoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(AppSize.md),
        backgroundColor: dark ? AppColors.dark : AppColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(
                  Iconsax.ship,
                  // color: Colors.white,
                  // size: 18,
                ),
                const SizedBox(width: AppSize.deafaultspace / 2),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Processing',
                          style: Theme.of(context).textTheme.bodyLarge!.apply(color: AppColors.primary,fontSizeDelta: 1)),
                      Text('01 Sep 2023',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
                IconButton(onPressed: (){} , icon: const Icon(Iconsax.arrow_right_34,size: AppSize.iconSm,))
              ],
            ),
            const SizedBox(height: AppSize.deafaultspace / 2),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(
                        Iconsax.ship,
                        // color: Colors.white,
                        // size: 18,
                      ),
                      const SizedBox(width: AppSize.deafaultspace / 2),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order',
                                style: Theme.of(context).textTheme.labelMedium!.apply(color: dark? AppColors.light: null)),
                            Text('[#615848]',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),


                Expanded(
                  child: Row(
                    children: [
                      const Icon(
                        Iconsax.calendar,
                        // color: Colors.white,
                        // size: 18,
                      ),
                      const SizedBox(width: AppSize.deafaultspace / 2),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date',
                                style: Theme.of(context).textTheme.labelMedium!.apply(color: dark? AppColors.light: null)),
                            Text('03 JAN 2024',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
