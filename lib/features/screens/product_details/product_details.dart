import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:ui/commons/widgets/sectionHeader/section_header.dart';
import 'package:ui/features/screens/product_details/widgets/buttom_add_to_cart.dart';
import 'package:ui/features/screens/product_details/widgets/product_attributes.dart';
import 'package:ui/features/screens/product_details/widgets/product_image_slider.dart';
import 'package:ui/features/screens/product_details/widgets/product_meta_data.dart';
import 'package:ui/features/screens/product_details/widgets/rating_and_share.dart';
import 'package:ui/features/screens/product_review/product_review.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

import '../../../MODEL_NEW/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // product image slider

            const ProductImageSlider(),

            //...........product Details.......//
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
              child: Column(
                children: [
                  //..........Rating and share...................//
                  const RatingAndShare(),
                  //.......price, title stock and brand.........//
                  const ProductMetaData(),
                  const SizedBox(height: 10),
                  //..........attributes................//
                  const ProductAttributes(),

                  const SizedBox(
                    height: 30,
                  ),
                  //..........Checkout Button ...........//
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Checkout'))),

                  //..........Description.................//
                  const SizedBox(
                    height: 32,
                  ),
                  const SectionHeading(
                      title: 'Description',
                      showActionButton: false,
                      padding: EdgeInsets.zero),
                  const ReadMoreText(
                    'This is Product Description for Genius mania dfu asuob sdus zsduiha scua soci sicsi csioc scnso cisn lsdicn sci svqeio and im feeling the mood ...jus de feel am',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  //............Reviews..............//

                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(
                          title: 'Reviews (825)', showActionButton: false),
                      IconButton(
                          onPressed: ()=> Get.to(()=>const  ProductReview()),
                          icon: const Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                          ))
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
