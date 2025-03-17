import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/commons/widgets/appbar/tabbar.dart';
import 'package:ui/commons/widgets/layouts/gridLayout/grid_layout.dart';
import 'package:ui/commons/widgets/sectionHeader/section_header.dart';
import 'package:ui/commons/widgets/shimmer_effect/brand_shimmer.dart';
import 'package:ui/features/screens/Store/widgets/category_tab.dart';
import 'package:ui/features/screens/home/widgets/search_bar.dart';
import 'package:ui/features/screens/home/widgets/shopping_counter.dart';
import 'package:ui/features/shop/controllers/category_controller.dart';
import 'package:ui/utils/helpers/helper_functions.dart';
import '../../../commons/widgets/brands/brand_card.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../shop/controllers/brand_controller.dart';
import '../brands/brands.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(BrandController());
    final categoryController = Get.put(CategoryController());
    final categories = categoryController.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: Appbar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            ShoppingCounter(
                iconColor: dark ? Colors.white : Colors.black, onPressed: () {})
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, isScrolled) {
              return [
                SliverAppBar(
                    pinned: true,
                    floating: true,
                    backgroundColor: dark ? Colors.black : AppColors.white,
                    expandedHeight: 360,
                    automaticallyImplyLeading: false,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(AppSize.deafaultspace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const SearchContainer(
                              text: 'Search in Store',
                              padding: EdgeInsets.all(0),
                              showBackground: false,
                              showBorder: true),
                          const SizedBox(height: AppSize.deafaultspace),
                          //............Brands...............//
                          SectionHeading(
                              padding: const EdgeInsets.all(0),
                              title: 'Featured Brands',
                              showActionButton: true,
                              onPressed: () => Get.to(() => const Brands())),

                          //........space.......//
                          const SizedBox(height: AppSize.spaceBtwTtems / 3.5),
                          //...........custom brands........//

                          Obx(() {
                            if (controller.isLoading.value) {
                              return const BrandShimmer();
                            } else if (controller.featuredBrands.isEmpty) {
                              return Center(
                                child: Text('No data',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .apply(color: Colors.white)),
                              );
                            }

                            return GridLayout(
                                itemCount: controller.featuredBrands.length,
                                mainAxisExtent: 65,
                                itemBuilder: (_, index) {
                                  final brand =
                                      controller.featuredBrands[index];
                                  return BrandCard(
                                    brand: brand,
                                    showBorder: true,
                                  );
                                });
                          })
                        ],
                      ),
                    ),
                    bottom: const TabBarWidget(tabs: [
                      Tab(child: Text('Sports')),
                      Tab(child: Text('Furniture')),
                      Tab(child: Text('Electronics')),
                      Tab(child: Text('Clothes')),
                      Tab(child: Text('Cosmetics')),
                      Tab(child: Text('Cosmetics')),
                      Tab(child: Text('Cosmetics')),
                      Tab(child: Text('Cosmetics')),
                    ]))
              ];
            },
            body:  TabBarView(children: categories.map((category)=> CategoryTab(category: category)).toList())),
      ),
    );
  }
}
