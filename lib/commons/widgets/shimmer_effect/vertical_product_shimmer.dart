import 'package:flutter/material.dart';
import 'package:ui/commons/widgets/layouts/gridLayout/grid_layout.dart';
import 'package:ui/commons/widgets/shimmer_effect/ShimmerEffect.dart';
import 'package:ui/utils/constants/sizes.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({super.key,  this.itemCount=4});
final int itemCount;
  @override
  Widget build(BuildContext context) {
    return GridLayout(itemCount: itemCount, itemBuilder: (_,__)=> const SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerEffect(width: 180, height: 180),
          SizedBox(height: AppSize.spaceBtwTtems),
          ShimmerEffect(width: 160, height: 15),
          SizedBox(height: AppSize.spaceBtwTtems/2),
          ShimmerEffect(width: 110, height: 15),
        ],
      ),
    ));
  }
}
