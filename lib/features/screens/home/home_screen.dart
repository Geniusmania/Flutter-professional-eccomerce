import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ui/commons/widgets/layouts/gridLayout/grid_layout.dart';
import 'package:ui/commons/widgets/products/products_cards/product_card_vertical.dart';
import 'package:ui/commons/widgets/sectionHeader/section_header.dart';
import 'package:ui/commons/widgets/shimmer_effect/ShimmerEffect.dart';
import 'package:ui/commons/widgets/shimmer_effect/vertical_product_shimmer.dart';
import 'package:ui/features/screens/all_products/all_products.dart';
import 'package:ui/features/screens/home/widgets/app_bar.dart';
import 'package:ui/features/screens/home/widgets/header.dart';
import 'package:ui/features/screens/home/widgets/home_categories.dart';
import 'package:ui/features/screens/home/widgets/search_bar.dart';
import 'package:ui/features/screens/home/widgets/slider.dart';
import 'package:ui/features/shop/controllers/product_controller.dart';
import 'package:ui/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(children: [
            // header Container
            const HomeHeaderContainer(
              child: Column(
                children: [
                  HomeAppBar(),
                  SizedBox(height: AppSize.spaceBtwSections / 2),

                  ///searchbar
                  SearchContainer(text: 'Search products'),
                  SizedBox(height: AppSize.spaceBtwSections / 2),

                  //section header
                  SectionHeading(
                    title: 'Popular Categories',
                    showActionButton: false,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: AppSize.spaceBtwTtems),

                  // categories
                  HomeCategories(),
                  SizedBox(height: 25),
                ],
              ),
            ),
//body part slider

            Padding(
                padding: const EdgeInsets.all(AppSize.deafaultspace),
                child: Column(
                  children: [
                    const PromoSlider(),
                    const SizedBox(height: AppSize.spaceBtwTtems),
                    SectionHeading(
                      title: 'Popular Products',
                      onPressed: () => Get.to(() => const AllProducts()),
                      padding: const EdgeInsets.all(0),
                    ),
                    Obx(() {
                      if (controller.isLoading.value) {
                        return const VerticalProductShimmer();
                      }
                      if (controller.allProducts.isEmpty) {
                        return const Center(child: Text('No Data Found'));
                      }
                      return GridLayout(
                          itemCount: controller.allProducts.length,
                          itemBuilder: (_, index) =>
                              ProductCardVertical(product: controller.allProducts[index]));
                    }),
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
