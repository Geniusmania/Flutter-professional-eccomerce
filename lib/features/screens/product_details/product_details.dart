import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/commons/widgets/icon/circular_icon.dart';
import 'package:ui/commons/widgets/rounded_image/rounded_image.dart';
import 'package:ui/features/containers/circular_container.dart';
import 'package:ui/features/screens/home/widgets/bottomCurve.dart';
import 'package:ui/features/screens/product_details/widgets/product_image_slider.dart';
import 'package:ui/features/screens/product_details/widgets/product_meta_data.dart';
import 'package:ui/features/screens/product_details/widgets/rating_and_share.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

import '../../../utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // product image slider

            ProductImageSlider(),

            //...........product Details.......//
            Padding(
              padding: EdgeInsets.only(right: 24, left: 24, bottom: 24),
              child: Column(
                children: [
                  //.....Rating and share
                  RatingAndShare(),
                  //.......price, title stock and brand.........//
ProductMetaData()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


