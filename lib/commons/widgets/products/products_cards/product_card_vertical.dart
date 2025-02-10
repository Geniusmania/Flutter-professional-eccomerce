import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/commons/widgets/icon/circular_icon.dart';
import 'package:ui/commons/widgets/products/product_price/product_price.dart';
import 'package:ui/commons/widgets/roudedContainer/rounded_container.dart';
import 'package:ui/commons/widgets/rounded_image/rounded_image.dart';
import 'package:ui/commons/widgets/texts/product_title_text.dart';
import 'package:ui/features/screens/home/classes/vertical_product_shadow.dart';
import 'package:ui/features/screens/product_details/product_details.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

import '../../title_and_icon/title_and_icon.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ()=> Get.to(()=> const ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [ShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(AppSize.productImageRadius),
            color: dark ? AppColors.darkgrey : AppColors.white),
        child: Column(
          children: [
            RoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(AppSize.sm),
              backgroundColor: dark ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  //........................//
                  const RoundedImage(
                    height: 180,
                    imageUrl: 'assets/products/3.jpg',
                    applyImageRadius: true,
                    fit: BoxFit.cover,
                  ),
      
                  //.....................//
                  //discount percentage
                  Positioned(
                      left: 10,
                      top: 5,
                      child: RoundedContainer(
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
                          ))),
      
                  //wislist heart
      
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: CircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
            const SizedBox(height: AppSize.spaceBtwTtems / 2),
            Padding(
              padding: const EdgeInsets.only(left:5),
              child: Align(alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const ProductTitleText(title: 'Red nice bag', smallSize: true),
                    const SizedBox(height: AppSize.spaceBtwTtems / 2.5),
                    BrandTitleWithIcon(title: 'Balaciaga',textColor: dark? Colors.white: Colors.black,),
                  ],
                ),
              ),
            ),
           const Spacer(),
            
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    const Padding(
                      padding: EdgeInsets.only(left: AppSize.sm),
                      child: ProductPrice(price: '25.3'),
                    ), 
                      
                      Container(decoration: const BoxDecoration(color: AppColors.dark,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(AppSize.cardRadiusMd),
                      bottomRight: Radius.circular(AppSize.productImageRadius)
                      )
                      ),child: const SizedBox(
                        height: AppSize.iconLg* 1.2,
                        width: AppSize.iconLg*1.2,
                        
                        child: Icon(Iconsax.add, color: AppColors.white,)),)// price
                    ],
                  )
          ],
        ),
      ),
    );
  }
}




