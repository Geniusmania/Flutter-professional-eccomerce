import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

    return Obx(() => Column(
      children: [
        // Display selected variation information
        if (controller.selectedVariation.value.id.isNotEmpty)
          RoundedContainer(
            padding: const EdgeInsets.all(16),
            backgroundColor: dark ? AppColors.darkergrey : AppColors.grey,
            child: Column(
              children: [
                Row(
                    children: [
                      const SectionHeading(
                          title: 'Variation: ',
                          showActionButton: false
                      ),
                      const SizedBox(width: AppSize.spaceBtwTtems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const ProductTitleText(
                                  title: 'Price: ',
                                  smallSize: true
                              ),
                              if (controller.selectedVariation.value.salePrice > 0)
                                Text(
                                    'GH₵${controller.selectedVariation.value.price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(decoration: TextDecoration.lineThrough)
                                ),
                              const SizedBox(width: AppSize.spaceBtwTtems),
                              ProductPrice(price: controller.getVariationPrice())
                            ],
                          ),
                          Row(
                            children: [
                              const ProductTitleText(
                                  title: 'Stock: ',
                                  smallSize: true
                              ),
                              Text(
                                  controller.variationStockStatus.value,
                                  style: Theme.of(context).textTheme.titleMedium
                              )
                            ],
                          ),
                        ],
                      )
                    ]
                ),
                if (controller.selectedVariation.value.description != null)
                  ProductTitleText(
                    title: controller.selectedVariation.value.description!,
                    smallSize: true,
                    maxLines: 4,
                  )
              ],
            ),
          ),
        const SizedBox(height: 16),

        // Display product attributes
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes != null
                ? product.productAttributes!.map((attribute) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeading(
                  title: attribute.name ?? '',
                  showActionButton: false,
                ),
                if (attribute.values != null)
                  Wrap(
                    spacing: 8,
                    children: attribute.values!.map((attributeValue) {
                      final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                      final available = controller.getAttributeAvailabilityInVariation(
                          product.productVariations ?? [],
                          attribute.name ?? ''
                      ).contains(attributeValue);

                      // Determine if this is a color attribute
                      final isColorAttribute = (attribute.name ?? '').toLowerCase().contains('color');

                      return ChoiceChipWidget(
                          text: attributeValue,
                          selected: isSelected,
                          isColorChip: isColorAttribute,
                          onSelected: available
                              ? (selected) {
                            if (selected && available) {
                              controller.onAttributeSelected(
                                  product,
                                  attribute.name ?? '',
                                  attributeValue
                              );
                            }
                          }
                              : null
                      );
                    }).toList(),
                  ),
              ],
            )).toList()
                : []
        )
      ],
    ));
  }
}