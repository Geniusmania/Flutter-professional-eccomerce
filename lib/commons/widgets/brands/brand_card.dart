import 'package:flutter/material.dart';
import 'package:ui/MODEL_NEW/brand_model.dart';

import '../../../features/containers/circular_container.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../roudedContainer/rounded_container.dart';
import '../title_and_icon/title_and_icon.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
    required this.brand,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        padding: const EdgeInsets.all(AppSize.xs),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            //..........icon.............//
            Flexible(
              child: CircularImage(
                  image: brand.image,
                  isNetworkImage: true,
                  backgroundColor: Colors.white,
                  overlayColor: dark ? Colors.white : Colors.white),
            ),

            const SizedBox(width: AppSize.spaceBtwTtems / 2),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandTitleWithIcon(
                      title: brand.name, brandTextSize: TextSizes.large),
                  Text('${brand.productsCount ?? 0} products',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: dark ? Colors.white : Colors.black))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
