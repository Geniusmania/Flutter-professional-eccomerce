import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/MODEL_NEW/product_model.dart';
import 'package:ui/commons/widgets/products/product_price/product_price.dart';
import 'package:ui/commons/widgets/roudedContainer/rounded_container.dart';
import 'package:ui/commons/widgets/rounded_image/rounded_image.dart';
import 'package:ui/commons/widgets/texts/product_title_text.dart';
import 'package:ui/features/screens/home/classes/vertical_product_shadow.dart';
import 'package:ui/features/screens/product_details/product_details.dart';
import 'package:ui/features/shop/controllers/product_controller.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/constants/enums.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

import '../../favourite_icon/favourite_icon.dart';
import '../../title_and_icon/title_and_icon.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
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
                  RoundedImage(
                    isNetworkImage: true,
                    height: 180,
                    imageUrl: product.thumbnail,
                    applyImageRadius: true,
                    fit: BoxFit.cover,
                  ),

                  //..........discount percentage...........//

                  if (salePercentage != null)
                    Positioned(
                      left: 10,
                      top: 5,
                      child: RoundedContainer(
                        radius: AppSize.sm,
                        backgroundColor:
                            AppColors.secondry.withValues(alpha: 0.9),
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.sm, vertical: AppSize.xs),
                        child: Text(
                          '$salePercentage%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: Colors.black),
                        ),
                      ),
                    ),

                  //wishlist heart

                   Positioned(
                    top: 0,
                    right: 0,
                    child: FavouriteIcon(productId: product.id),
                  )
                ],
              ),
            ),
            const SizedBox(height: AppSize.spaceBtwTtems / 3),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ProductTitleText(title: product.title, smallSize: true),
                    const SizedBox(height: AppSize.spaceBtwTtems / 2.5),
                    BrandTitleWithIcon(
                      title: product.brand!.name,
                      textColor: dark ? Colors.white : Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                            padding: const EdgeInsets.only(left: AppSize.sm),
                            child: Text(
                              product.price.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(
                                      decoration: TextDecoration.lineThrough),
                            )),
                      Padding(
                        padding: const EdgeInsets.only(left: AppSize.sm),
                        child: ProductPrice(
                            price: controller.getProductPrice(product)),
                      ),
                    ],
                  ),
                ),

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
                // price
              ],
            )
          ],
        ),
      ),
    );
  }
}


