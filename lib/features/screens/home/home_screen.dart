import 'package:flutter/material.dart';
import 'package:ui/commons/widgets/layouts/grid_layout.dart';
import 'package:ui/commons/widgets/products/products_cards/product_card_vertical.dart';
import 'package:ui/commons/widgets/sectionHeader/section_header.dart';
import 'package:ui/features/screens/home/widgets/app_bar.dart';
import 'package:ui/features/screens/home/widgets/header.dart';
import 'package:ui/features/screens/home/widgets/home_categories.dart';
import 'package:ui/features/screens/home/widgets/search_bar.dart';
import 'package:ui/features/screens/home/widgets/slider.dart';
import 'package:ui/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  HomeCategories()
                ],
              ),
            ),
//body part slider

            Padding(
                padding: const EdgeInsets.all(AppSize.deafaultspace),
                child: Column(
                  children: [
                    const PromoSlider(banners: [
                      'assets/images/dark.jpg',
                      'assets/images/light.jpg',
                      'assets/images/dark.jpg',
                      'assets/images/light.jpg'
                    ]),
                    const SizedBox(height: AppSize.spaceBtwTtems),
                    SectionHeading(title: 'Popular Products', onPressed: () {}),
                    GridLayout(
                        itemCount: 2,
                        itemBuilder: (_, index) => const ProductCardVertical()),
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
