import 'package:flutter/material.dart';
import 'package:ui/commons/widgets/shimmer_effect/ShimmerEffect.dart';

import '../layouts/gridLayout/grid_layout.dart';

class BrandShimmer extends StatelessWidget {
  const BrandShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return  GridLayout(
        itemCount: 4,
        mainAxisExtent: 65,
        itemBuilder: (_, __) => const ShimmerEffect(width: 300, height: 80));
  }
}
