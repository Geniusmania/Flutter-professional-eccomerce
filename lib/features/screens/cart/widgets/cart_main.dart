import 'package:flutter/material.dart';
import 'package:ui/features/screens/cart/widgets/product_add_and_remove_button.dart';

import '../../../../commons/widgets/products/product_price/product_price.dart';
import 'cart_item.dart';

class CartMainItem extends StatelessWidget {
  const CartMainItem({super.key,  this.showAddRemoveButton =true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemCount: 2,
        itemBuilder: (_, index) => Column(
          children: [
            const CartItem(),
            if (showAddRemoveButton)const SizedBox(height: 8),
            if (showAddRemoveButton)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70),
                      ProductQuantityWithAddAndRemoveButton(),
                    ],
                  ),
                  ProductPrice(price: '168')
                ],
              )
          ],
        ),
      ),
    );
  }
}
