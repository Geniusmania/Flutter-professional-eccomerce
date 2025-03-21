import 'package:flutter/material.dart';
import 'package:ui/commons/widgets/layouts/gridLayout/grid_layout.dart';
import 'package:ui/commons/widgets/shimmer_effect/ShimmerEffect.dart';
import 'package:ui/utils/constants/sizes.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerEffect(width: 180, height: 180),
                  SizedBox(height: AppSize.spaceBtwTtems),
                  ShimmerEffect(width: 160, height: 15),
                  SizedBox(height: AppSize.spaceBtwTtems / 2),
                  ShimmerEffect(width: 110, height: 15),
                ],
              ),
            ));
  }
}

class HorizontalProductShimmer extends StatelessWidget {
  const HorizontalProductShimmer({super.key,  this.itemCount=4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: AppSize.spaceBtwTtems),
        height: 120,
        child: ListView.separated(
          separatorBuilder: (context, index) =>
              const SizedBox(width: AppSize.spaceBtwTtems),
          itemCount: itemCount,
          itemBuilder: (_,__)=> const Row(
            mainAxisSize: MainAxisSize.min,

            children: [
              ShimmerEffect(width: 120, height: 120),
              SizedBox(width: AppSize.spaceBtwTtems),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSize.spaceBtwTtems/2),
                  ShimmerEffect(width: 120, height: 120)
                ],
              )


            ],
          ),
        ));
  }
}
