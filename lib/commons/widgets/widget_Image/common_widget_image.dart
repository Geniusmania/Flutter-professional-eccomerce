import 'package:flutter/material.dart';
import 'package:ui/features/containers/circular_container.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class VerticalImageText extends StatelessWidget {
  final bool isNetWorkImage;
  final String image, title;
  final Color textColor;
  final void Function()? onTap;
  final Color? backgroundColor;

  const VerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = Colors.white,
    this.onTap,
    this.backgroundColor,
    this.isNetWorkImage = true,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: AppSize.spaceBtwTtems / 2),
        child: Column(
          children: [
            CircularImage(
              image: image,
              fit: BoxFit.contain,
              padding: AppSize.sm * 1.4,
              isNetworkImage: isNetWorkImage,
              backgroundColor: backgroundColor,
              overlayColor: dark ? AppColors.light : AppColors.dark,
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 55,
              child: Center(
                  child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )),
            )
          ],
        ),
      ),
    );
  }
}
