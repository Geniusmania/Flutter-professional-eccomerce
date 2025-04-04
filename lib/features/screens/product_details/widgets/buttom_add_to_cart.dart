import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/MODEL_NEW/product_model.dart';
import 'package:ui/commons/widgets/icon/circular_icon.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/helpers/helper_functions.dart';
import '../../../../utils/constants/colors.dart';
import '../../../shop/controllers/cart_controller.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    // Ensure this runs only after the first frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.updateAlreadyAddedProductCount(product);
    });
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSize.deafaultspace,
          vertical: AppSize.deafaultspace / 2),
      decoration: BoxDecoration(
          color: dark ? AppColors.darkergrey : AppColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSize.cardRadiusLg),
            topRight: Radius.circular(AppSize.cardRadiusLg),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(()=> Row(
              children: [
                CircularIcon(
                  icon: Iconsax.minus,
                  width: 40,
                  height: 40,
                  color: AppColors.white,
                  backgroundColor: AppColors.darkgrey,
                  onPressed: () => controller.productQuantityInCart.value < 1
                      ? null
                      : controller.productQuantityInCart.value -= 1,
                ),
                const SizedBox(width: AppSize.spaceBtwTtems),
                Text(controller.productQuantityInCart.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: AppSize.spaceBtwTtems),
                CircularIcon(
                    icon: Iconsax.add,
                    width: 40,
                    height: 40,
                    color: AppColors.white,
                    backgroundColor: AppColors.black,
                    onPressed: () => controller.productQuantityInCart.value += 1),
              ],
            ),
          ),
          Obx(()=> ElevatedButton(
                onPressed: controller.productQuantityInCart.value < 1 ? null : ()=> controller.addToCart(product),
                style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    backgroundColor: AppColors.black),
                child: const Text('Add to Cart')),
          )
        ],
      ),
    );
  }
}
