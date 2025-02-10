import 'package:flutter/material.dart';
import 'package:ui/commons/widgets/products/product_price/product_price.dart';
import 'package:ui/commons/widgets/texts/product_title_text.dart';
import 'package:ui/commons/widgets/title_and_icon/title_and_icon.dart';
import 'package:ui/features/containers/circular_container.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

import '../../../../commons/widgets/roudedContainer/rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column (
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Row(children: [
        RoundedContainer(
            radius: AppSize.sm,
            backgroundColor: AppColors.secondry.withOpacity(0.9),
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.sm, vertical: AppSize.xs),
            child: Text(
              '20%',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: Colors.black),
            )),
        const SizedBox(width: 24),
        Text('GH₵354',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
        const SizedBox(width: 24),
        const ProductPrice(price: '1658',isLarge: true,)
      ],),

      const SizedBox(height: 16/1.5),
      const ProductTitleText(title: 'Fair Nice Chicki'),
      const SizedBox(height: 16/1.5),
      Row(
        children: [
          const ProductTitleText(title: 'Status'),
          const SizedBox(width: 16),
          Text('In Stock' ,style: Theme.of(context).textTheme.titleMedium),
        ],
        
        
      ),

        const SizedBox(height: 16/1.5),
        
        Row(
          children: [
            CircularImage(
                width: 32,
                height: 32,
                overlayColor: dark? Colors.white: Colors.black,
                image: 'assets/images/dark.jpg'),
            const SizedBox(width: 8),
             const BrandTitleWithIcon(title: 'Nike', brandTextSize: TextSizes.medium,),
          ],
        )
    ],);
  }
}
