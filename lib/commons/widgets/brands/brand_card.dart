
import 'package:flutter/material.dart';

import '../../../features/containers/circular_container.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../roudedContainer/rounded_container.dart';
import '../title_and_icon/title_and_icon.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key, required this.showBorder, this.onTap,
  });
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
                  image: 'assets/images/img.png',
                  isNetworkImage: false,
                  backgroundColor: Colors.transparent,
                  overlayColor: dark ? Colors.white : Colors.black),
            ),

            const SizedBox(width: AppSize.spaceBtwTtems / 2),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BrandTitleWithIcon(
                      title: 'Nike', brandTextSize: TextSizes.large),
                  Text('242 products',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium!.apply(color: dark? Colors.white: Colors.black))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
