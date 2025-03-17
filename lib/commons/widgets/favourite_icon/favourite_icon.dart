import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../icon/circular_icon.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircularIcon(
      icon: Iconsax.heart5,
      color: Colors.red,
    );
  }
}
