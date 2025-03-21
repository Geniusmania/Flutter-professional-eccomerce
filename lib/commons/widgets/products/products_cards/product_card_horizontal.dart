import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/commons/widgets/favourite_icon/favourite_icon.dart';
import 'package:ui/commons/widgets/products/product_price/product_price.dart';
import 'package:ui/commons/widgets/roudedContainer/rounded_container.dart';
import 'package:ui/commons/widgets/texts/product_title_text.dart';
import 'package:ui/commons/widgets/title_and_icon/title_and_icon.dart';
import 'package:ui/features/shop/controllers/product_controller.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/helpers/helper_functions.dart';
import '../../../../MODEL_NEW/product_model.dart';
import '../../icon/circular_icon.dart';
import '../../rounded_image/rounded_image.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key, required  this.product});
final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final  controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(

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
                 SizedBox(
                  height: 120,
                  width: 120,
                  child: RoundedImage(
                    isNetworkImage: true,
                      applyImageRadius: true,
                      imageUrl: product.thumbnail),
                ),if(salePercentage != null)
                Positioned(
                    // left: 0,
                    top: 2,
                    child: RoundedContainer(
                        radius: AppSize.sm,
                        backgroundColor: AppColors.secondry.withValues(alpha: 0.9),
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.sm, vertical: AppSize.xs),
                        child: Text(
                          '$salePercentage%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: Colors.black),
                        ))),

                //wishlist heart

                  Positioned(
                    top: -2,
                    right: -10,
                    child:
                FavouriteIcon(productId:product.id,))
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
                       ProductTitleText(
                        title: product.title,
                        smallSize: true,
                      ),
                      const SizedBox(height: AppSize.spaceBtwTtems / 2),
                      BrandTitleWithIcon(title: product.brand!.name,textColor: dark? AppColors.light: null,)
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Flexible(child: ProductPrice(price: controller.getProductPrice(product))),
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
