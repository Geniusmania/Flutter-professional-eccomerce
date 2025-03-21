import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/commons/widgets/products/products_cards/product_card_horizontal.dart';
import 'package:ui/commons/widgets/rounded_image/rounded_image.dart';
import 'package:ui/commons/widgets/sectionHeader/section_header.dart';
import 'package:ui/features/screens/all_products/all_products.dart';
import 'package:ui/features/shop/controllers/category_controller.dart';
import 'package:ui/utils/constants/sizes.dart';
import '../../../MODEL_NEW/category_model.dart';
import '../../../commons/widgets/shimmer_effect/vertical_product_shimmer.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../utils/popups/animation_loader.dart';
import '../../button_navigation_bar/button_nav_bar.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final height = HelperFunctions.screenHeight(context);
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: Appbar(
        title: Text(category.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSize.deafaultspace),
          child: Column(
            children: [
              RoundedImage(
                  isNetworkImage: true,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: height * 0.25,
                  applyImageRadius: true,
                  imageUrl: category.imageUrl),
              const SizedBox(height: AppSize.spaceBtwSections),
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const HorizontalProductShimmer();
                    }
                    if (!snapshot.hasData ||
                        snapshot.data == null ||
                        snapshot.data!.isEmpty) {
                      return const AnimationLoaderWidget(
                        text: 'No favourites added!',
                        animation: 'assets/animations/empty.json',
                      );
                    }

                    final subcategories = snapshot.data!;

                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: subcategories.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          final subcategory = subcategories[index];
                          return FutureBuilder(
                              future: controller
                                  .getCategoryProducts(subcategory.id),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const HorizontalProductShimmer();
                                }
                                if (!snapshot.hasData ||
                                    snapshot.data == null ||
                                    snapshot.data!.isEmpty) {
                                  return const AnimationLoaderWidget(
                                    text: 'No favourites added!',
                                    animation: 'assets/animations/empty.json',
                                  );
                                }
                                final products = snapshot.data!;
                                return Column(children: [
                                  SectionHeading(
                                    title: subcategory.name,
                                    onPressed: () => Get.to(
                                      () => AllProducts(
                                        title: subcategory.name,
                                        futureMethod:
                                            controller.getCategoryProducts(
                                                subcategory.id),
                                      ),
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                  const SizedBox(
                                      height: AppSize.deafaultspace / 2),
                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(width: 16),
                                      itemCount: products.length,
                                      itemBuilder: (_, index) =>
                                          ProductCardHorizontal(
                                              product: products[index]),
                                    ),
                                  ),
                                ]);
                              });
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
