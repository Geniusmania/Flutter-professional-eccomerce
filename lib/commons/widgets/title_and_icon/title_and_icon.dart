import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import '../texts/brand_title_text.dart';

class BrandTitleWithIcon extends StatelessWidget {
  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  const BrandTitleWithIcon({
    super.key,
    required this.title,
     this.maxLines =1,
    this.textColor,
    this.iconColor = AppColors.primary,
    this.textAlign= TextAlign.center,
     this.brandTextSize = TextSizes.small,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child:


          BrandTitleText(title: title,
          color: textColor,
          maxLines: maxLines,
            textAlign: textAlign,
            brandTextSizes: brandTextSize,
          ),
        ),
        const SizedBox(width: AppSize.spaceBtwTtems / 2),
        const Icon(
          Iconsax.verify5,
          color: AppColors.primary,
          size: AppSize.iconXs,
        )
      ],
    );
  }
}

