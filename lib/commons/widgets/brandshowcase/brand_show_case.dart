import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/commons/widgets/shimmer_effect/ShimmerEffect.dart';
import 'package:ui/features/screens/brands/brand_products.dart';

import '../../../MODEL_NEW/brand_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../brands/brand_card.dart';
import '../roudedContainer/rounded_container.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });

  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: RoundedContainer(
        padding: const EdgeInsets.all(AppSize.md),
        showBorder: true,
        borderColor: AppColors.darkgrey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: AppSize.spaceBtwTtems),
        child: Column(
          children: [
            //........brand with product image
            BrandCard(showBorder: false, brand: brand),

            Row(
              children: images
                  .map((image) => brandProductAndImage(image, context))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

Widget brandProductAndImage(String image, context) {
  final dark = HelperFunctions.isDarkMode(context);
  return Expanded(
    child: RoundedContainer(
      height: 100,
      backgroundColor: dark ? AppColors.darkergrey : AppColors.light,
      margin: const EdgeInsets.only(right: AppSize.sm),
      padding: const EdgeInsets.all(4),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            const ShimmerEffect(width: 100, height: 100),errorWidget: (context,url,error)=> const Icon(Icons.error),
      ),
    ),
  );
}
