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
import 'package:ui/features/shop/controllers/product_controller.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

import '../../../MODEL_NEW/product_model.dart';
import '../../../utils/constants/enums.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final cartController = Get.find<ProductController>(); // For checkout functionality

    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product image slider
            ProductImageSlider(product: product),

            // Product Details
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
              child: Column(
                children: [
                  // Rating and share
                  const RatingAndShare(),

                  // Price, title, stock and brand
                  ProductMetaData(product: product),
                  const SizedBox(height: 10),

                  // Product attributes (if it's a variable product)
                 // if (product.productType == ProductType.variable.name)
                    ProductAttributes(product: product),
                    const SizedBox(height: 30),


                  // Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            // Implement checkout functionality
                            Get.snackbar(
                              'Checkout',
                              'Processing your order...',
                              snackPosition: SnackPosition.BOTTOM,
                            );
                            // Add your checkout logic here
                          },
                          child: const Text('Checkout')
                      )
                  ),

                  // Description
                  const SizedBox(height: 32),
                  const SectionHeading(
                      title: 'Description',
                      showActionButton: false,
                      padding: EdgeInsets.zero
                  ),
                  if (product.description != null && product.description!.isNotEmpty)
                    ReadMoreText(
                      product.description!,
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Less',
                      lessStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800
                      ),
                      moreStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800
                      ),
                    ),

                  // Reviews section
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(
                          title: 'Reviews (825)',
                          showActionButton: false
                      ),
                      IconButton(
                          onPressed: () => Get.to(() => const ProductReview()),
                          icon: const Icon(Iconsax.arrow_right_3, size: 18)
                      )
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