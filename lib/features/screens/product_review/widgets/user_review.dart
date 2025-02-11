import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:ui/commons/widgets/roudedContainer/rounded_container.dart';
import 'package:ui/features/screens/product_review/widgets/rating_bar_indicator.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/light.jpg'),
                ),
                const SizedBox(
                  width: AppSize.spaceBtwTtems,
                ),
                Text(
                  'Chicki App',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(
          height: AppSize.spaceBtwTtems,
        ),
        Row(
          children: [
            const RatingBarIndicatorWidget(rating: 4),
            const SizedBox(
              width: AppSize.spaceBtwTtems,
            ),
            Text(
              '01 Nov, 2023',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: AppSize.spaceBtwTtems,
        ),
        const ReadMoreText(
          'The size chips should now appear as normal rounded rectangle chips with text, while color chips will remain as circular color swatches.Would you like me to explain any part of this fix in more detail?',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          moreStyle: TextStyle(fontSize: 14, color: AppColors.primary),
          lessStyle: TextStyle(fontSize: 14, color: AppColors.primary),
        ),
        const SizedBox(
          height: AppSize.spaceBtwTtems,
        ),
        RoundedContainer(
          backgroundColor: dark ? AppColors.darkergrey : AppColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Mania's store",
                        style: Theme.of(context).textTheme.titleMedium),
                    Text("01 Nov, 2023",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(
                  height: AppSize.spaceBtwTtems,
                ),
                const ReadMoreText(
                  'The size chips should now appear as normal rounded rectangle chips with text, while color chips will remain as circular color swatches.Would you like me to explain any part of this fix in more detail?',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show more',
                  moreStyle: TextStyle(fontSize: 14, color: AppColors.primary),
                  lessStyle: TextStyle(fontSize: 14, color: AppColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: AppSize.spaceBtwSections,
        ),
      ],
    );
  }
}
