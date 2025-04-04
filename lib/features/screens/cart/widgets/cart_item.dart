import 'package:flutter/material.dart';
import 'package:ui/MODEL_NEW/cart_item_model.dart';
import '../../../../commons/widgets/rounded_image/rounded_image.dart';
import '../../../../commons/widgets/texts/product_title_text.dart';
import '../../../../commons/widgets/title_and_icon/title_and_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.item,
  });

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Row(
      children: [
        RoundedImage(
          isNetworkImage: true,
          imageUrl: item.image ?? '',
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(8),
          backgroundColor: dark ? AppColors.darkergrey : AppColors.light,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleWithIcon(
                  title: item.brandName!,
                  textColor: dark ? AppColors.white : AppColors.black),
              Flexible(
                child: ProductTitleText(title: item.title, maxLines: 1),
              ),
              Text.rich(
                TextSpan(
                    children: (item.selectedVariations ?? {})
                        .entries
                        .map(
                          (e) => TextSpan(children: [
                            TextSpan(
                                text: '${e.key}: ',
                                style: Theme.of(context).textTheme.bodySmall),

                            TextSpan(
                                text: '${e.value} ',
                                style: Theme.of(context).textTheme.bodySmall),
                          ]),
                        )
                        .toList()),
              ),
            ],
          ),
        )
      ],
    );
  }
}
