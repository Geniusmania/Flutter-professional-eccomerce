import 'package:flutter/material.dart';
import 'package:ui/MODEL_NEW/product_model.dart';
import 'package:ui/commons/widgets/products/product_price/product_price.dart';
import 'package:ui/commons/widgets/texts/product_title_text.dart';
import 'package:ui/commons/widgets/title_and_icon/title_and_icon.dart';
import 'package:ui/features/containers/circular_container.dart';
import 'package:ui/features/shop/controllers/product_controller.dart';
import 'package:ui/utils/helpers/helper_functions.dart';
import '../../../../commons/widgets/roudedContainer/rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercent =
        controller.calculateSalePercentage(product.price, product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RoundedContainer(
                radius: AppSize.sm,
                backgroundColor: AppColors.secondry.withValues(alpha: 0.9),
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.sm, vertical: AppSize.xs),
                child: Text(
                  '$salePercent%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: Colors.black),
                )),
            const SizedBox(width: 24),
            if (product.productType == ProductType.single.name &&
                product.salePrice > 0)
              Text('GH₵${product.price}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(decoration: TextDecoration.lineThrough)),
            if (product.productType == ProductType.single.name &&
                product.salePrice > 0)
              const SizedBox(width: 18),
            ProductPrice(
              price: controller.getProductPrice(product),
              isLarge: true,
            )
          ],
        ),
        const SizedBox(height: 16),
        ProductTitleText(title: product.title),
        const SizedBox(height: 16 / 1.5),
        Row(children: [
          const ProductTitleText(
            title: 'Status:',
            smallSize: true,
          ),
          const SizedBox(width: 10),
          Text(controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium),
        ]),
        const SizedBox(height: 16 / 1.5),
        Row(
          children: [
            CircularImage(
                width: 32,
                height: 32,
                overlayColor: dark ? Colors.white : Colors.black,
                image: product.brand!.image ?? ''),
            const SizedBox(width: 8),
            BrandTitleWithIcon(
              title: product.brand != null ? product.brand!.name : '',
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
