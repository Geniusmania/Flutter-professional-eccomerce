import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/commons/widgets/favourite_icon/favourite_icon.dart';
import 'package:ui/commons/widgets/products/product_price/product_price.dart';
import 'package:ui/commons/widgets/roudedContainer/rounded_container.dart';
import 'package:ui/commons/widgets/texts/product_title_text.dart';
import 'package:ui/commons/widgets/title_and_icon/title_and_icon.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/helpers/helper_functions.dart';
import '../../icon/circular_icon.dart';
import '../../rounded_image/rounded_image.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
       // boxShadow: [ShadowStyle.horizontalProductShadow],
        color: dark ? AppColors.darkergrey : AppColors.lightContainer,
      ),
      child: Row(
        children: [
          RoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(AppSize.sm),
            backgroundColor: dark ? AppColors.dark : AppColors.light,
            child: Stack(
              children: [
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: RoundedImage(
                      applyImageRadius: true,
                      imageUrl: 'assets/images/shoe1.jpg'),
                ),
                Positioned(
                    // left: 0,
                    top: 2,
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

                //wishlist heart

                const Positioned(
                    top: -2,
                    right: -10,
                    child:
                FavouriteIcon())
              ],
            ),
          ),

          //Details
          SizedBox(width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: AppSize.sm,left:AppSize.sm ),
              child: Column(
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProductTitleText(
                        title: 'Green balanciaga classic shoe ',
                        smallSize: true,
                      ),
                      const SizedBox(height: AppSize.spaceBtwTtems / 2),
                      BrandTitleWithIcon(title: 'Balanciaga',textColor: dark? AppColors.light: null,)
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    const Flexible(child: ProductPrice(price: '158' )),
                    Container(
                      decoration: const BoxDecoration(
                          color: AppColors.dark,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppSize.cardRadiusMd),
                              bottomRight:
                              Radius.circular(AppSize.productImageRadius))),
                      child: const SizedBox(
                          height: AppSize.iconLg * 1.2,
                          width: AppSize.iconLg * 1.2,
                          child: Icon(
                            Iconsax.add,
                            color: AppColors.white,
                          )),
                    )
                  ],)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
