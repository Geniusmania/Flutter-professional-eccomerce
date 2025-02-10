
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../brands/brand_card.dart';
import '../roudedContainer/rounded_container.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key, required this.images,
  });
final List<String> images;
  

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return RoundedContainer(
      padding: const EdgeInsets.all(AppSize.md),
      showBorder: true,
      borderColor: AppColors.darkgrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: AppSize.spaceBtwTtems),
      child: Column(
        children: [
          //........brand with product image
          const BrandCard(showBorder: false),

          Row(
            children: images.map((image)=> brandProductAndImage(image, context)).toList(),
          )
        ],
      ),
    );
  }
}
Widget brandProductAndImage(String image, context){
  final dark= HelperFunctions.isDarkMode(context);
  return Expanded(
    child: RoundedContainer(
      height: 100,
      backgroundColor:
      dark ? AppColors.darkergrey : AppColors.light,
      margin: const EdgeInsets.only(right: AppSize.sm),
      padding: const EdgeInsets.all(4),
      child:   Image(
          image: AssetImage(image),
          fit: BoxFit.contain),
    ),
  );
}
