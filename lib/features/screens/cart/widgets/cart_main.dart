import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/features/screens/cart/widgets/product_add_and_remove_button.dart';
import 'package:ui/features/shop/controllers/cart_item_controller.dart';

import '../../../../commons/widgets/products/product_price/product_price.dart';
import 'cart_item.dart';

class CartMainItem extends StatelessWidget {
  const CartMainItem({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Obx(
        () => ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemCount: controller.cartItems.length,
          itemBuilder: (_, index) => Obx(() {
            final item = controller.cartItems[index];
            return Column(
              children: [
                CartItem(item: item),
                if (showAddRemoveButton) const SizedBox(height: 8),
                if (showAddRemoveButton)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 70),
                          ProductQuantityWithAddAndRemoveButton(
                            quantity: item.quantity,
                            add: () => controller.addOneToCart(item),
                            remove: () => controller.removeOneFromCart(item),
                          ),
                        ],
                      ),
                      ProductPrice(price: (item.price * item.quantity).toString())
                    ],
                  )
              ],
            );
          }),
        ),
      ),
    );
  }
}
