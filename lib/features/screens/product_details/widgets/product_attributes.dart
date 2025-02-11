import 'package:flutter/material.dart';
import 'package:ui/commons/widgets/products/product_price/product_price.dart';
import 'package:ui/commons/widgets/roudedContainer/rounded_container.dart';
import 'package:ui/commons/widgets/sectionHeader/section_header.dart';
import 'package:ui/commons/widgets/texts/product_title_text.dart';
import 'package:ui/utils/helpers/helper_functions.dart';
import '../../../../commons/widgets/chips/choice_chip.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(children: [
      RoundedContainer(
        padding: const EdgeInsets.all(16),
        backgroundColor: dark ? AppColors.darkergrey : AppColors.grey,
        child: Column(
          children: [
            Row(children: [
              const SectionHeading(title: 'Variation: ', showActionButton: false),
              const SizedBox(width: AppSize.spaceBtwTtems),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const ProductTitleText(title: 'Price: ', smallSize: true),
                      Text('GH₵354',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .apply(decoration: TextDecoration.lineThrough)),
                      const SizedBox(width: AppSize.spaceBtwTtems),
                      const ProductPrice(price: '515')
                    ],
                  ),
                  Row(
                    children: [
                      const ProductTitleText(title: 'Stock: ', smallSize: true),
                      Text('In Stock',
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                ],
              ),
            ]),
            const ProductTitleText(
              title:
                  'This is the description of the products and it can take up to 4 lines.',
              smallSize: true,
              maxLines: 4,
            )
          ],
        ),
      ),
      const SizedBox(height: 16),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(title: 'Colors', showActionButton: false,),
          Wrap(
            spacing: 8,
            children: [
              ChoiceChipWidget(
                  text: 'green', selected: true, onSelected: (value) {},isColorChip: true),
              ChoiceChipWidget(
                  text: 'blue', selected: false, onSelected: (value) {},isColorChip: true),
              ChoiceChipWidget(
                  text: 'yellow', selected: false, onSelected: (value) {},isColorChip: true),
            ],
          )
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(title: 'Size',showActionButton: false,),
          Wrap(
            spacing: 8,
            children: [
              ChoiceChipWidget(
                  text: '34', selected: true, onSelected: (value) {}),
              ChoiceChipWidget(
                  text: 'EU 36', selected: false, onSelected: (value) {}),
              ChoiceChipWidget(
                  text: 'EU 32', selected: false, onSelected: (value) {}),
            ],
          )
        ],
      )
    ]);
  }
}
