import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/features/shop/controllers/cart_item_controller.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

import '../../cart/cart.dart';

class ShoppingCounter extends StatelessWidget {
  final Color iconColor;

  const ShoppingCounter({
    super.key,  this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final dark =HelperFunctions.isDarkMode(context);
    final controller = Get.put(CartController());
    return Stack(
      children: [
        IconButton(
          onPressed: ()=> Get.to(()=> const CartScreen()),
          icon: const Icon(Iconsax.shopping_bag),
          color:iconColor,
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:dark? AppColors.white: AppColors.black.withValues(alpha: 0.5)),
            child: Center(
              child: Obx(()=> Text(
                  controller.noOfCartItems.value.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color:dark?Colors.black:  Colors.white, fontSizeFactor: .9),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
