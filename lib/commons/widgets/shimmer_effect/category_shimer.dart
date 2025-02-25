import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import 'ShimmerEffect.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) =>
        const SizedBox(width: AppSize.spaceBtwTtems),
        itemCount: itemCount,
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: AppSize.spaceBtwTtems/2),
              ShimmerEffect(width: 55, height: 8,),
            ]
          );
        },
      ),
    );
  }
}
