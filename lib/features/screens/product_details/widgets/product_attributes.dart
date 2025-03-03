import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ui/MODEL_NEW/product_model.dart';
import 'package:ui/commons/widgets/products/product_price/product_price.dart';
import 'package:ui/commons/widgets/roudedContainer/rounded_container.dart';
import 'package:ui/commons/widgets/sectionHeader/section_header.dart';
import 'package:ui/commons/widgets/texts/product_title_text.dart';
import 'package:ui/features/shop/controllers/variation_controller.dart';
import 'package:ui/utils/helpers/helper_functions.dart';
import '../../../../commons/widgets/chips/choice_chip.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Column(children: [
      if (controller.selectedVariation.value.id.isNotEmpty)
        RoundedContainer(
          padding: const EdgeInsets.all(16),
          backgroundColor: dark ? AppColors.darkergrey : AppColors.grey,
          child: Column(
            children: [
              Row(children: [
                const SectionHeading(
                    title: 'Variation: ', showActionButton: false),
                const SizedBox(width: AppSize.spaceBtwTtems),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const ProductTitleText(
                            title: 'Price: ', smallSize: true),
                        Text('GH₵354',
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough)),
                        const SizedBox(width: AppSize.spaceBtwTtems),
                        const ProductPrice(price: '515')
                      ],
                    ),
                    Row(
                      children: [
                        const ProductTitleText(
                            title: 'Stock: ', smallSize: true),
                        Text('In Stock',
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleMedium),
                      ],
                    ),
                  ],
                )
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
          children: product.productAttributes!
              .map((attribute) =>
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeading(
                    title: attribute.name ?? '',
                    showActionButton: false,
                  ),
                  Wrap(
                      spacing: 8,
                      children: attribute.values!.map((attributeValue) {
                        final isSelected = controller
                            .selectedAttributes[attribute.name] ==
                            attributeValue;
                        final available = controller
                            .getAttributeAvailabilityInVariation(product
                            .productVariations!, attribute.name!).contains(attributeValue);

                        return ChoiceChipWidget(
                            text: attributeValue,
                            selected: isSelected,
                            onSelected: available ? (selected){
                              if(selected&& available){
                                controller.onAttributeSelected(product, attribute.name??'', attributeValue);
                              }
                            }: null);
                      }).toList())
                ],
              ))
              .toList())
    ]);
  }
}
