import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../MODEL_NEW/product_model.dart';
import '../../../../utils/constants/sizes.dart';
import '../../layouts/gridLayout/grid_layout.dart';
import '../products_cards/product_card_vertical.dart';

class SortedProducts extends StatelessWidget {
  const SortedProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //DropDownFormField

        DropdownButtonFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.sort), isDense: true),
            onChanged: (value) {},
            items: [
              'Name',
              'Higher Price',
              'Lower Price',
              'Sale',
              'Newest',
              'Popularity'
            ].map((option) => DropdownMenuItem(
              value: option,
              child: Text(option),
            ))
                .toList()),

        const SizedBox(height: AppSize.spaceBtwSections,),
        GridLayout(itemCount: 8, itemBuilder: (_, index)=>  ProductCardVertical(product: ProductModel.empty()))
      ],
    );
  }
}
