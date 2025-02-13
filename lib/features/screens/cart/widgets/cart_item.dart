import 'package:flutter/material.dart';
import '../../../../commons/widgets/rounded_image/rounded_image.dart';
import '../../../../commons/widgets/texts/product_title_text.dart';
import '../../../../commons/widgets/title_and_icon/title_and_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Row(
      children: [
        RoundedImage(
          imageUrl: 'assets/products/3.jpg',
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(8),
          backgroundColor:
          dark ? AppColors.darkergrey : AppColors.light,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleWithIcon(
                  title: 'Balanciaga',
                  textColor: dark ? AppColors.white : AppColors.black),
              const Flexible(
                child: ProductTitleText(
                    title: 'Red nice bag', maxLines: 1),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color: ',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(color: dark ? Colors.white54 : null)),
                TextSpan(
                    text: 'Green  ',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: 'Size: ',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(color: dark ? Colors.white54 : null)),
                TextSpan(
                    text: 'EU 42',
                    style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
