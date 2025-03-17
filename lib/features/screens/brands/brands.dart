import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/commons/widgets/brands/brand_card.dart';
import 'package:ui/commons/widgets/layouts/gridLayout/grid_layout.dart';
import 'package:ui/commons/widgets/shimmer_effect/brand_shimmer.dart';
import 'package:ui/features/screens/brands/brand_products.dart';
import 'package:ui/features/shop/controllers/brand_controller.dart';
import 'package:ui/utils/constants/sizes.dart';

import '../../../commons/widgets/sectionHeader/section_header.dart';

class Brands extends StatelessWidget {
  const Brands({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: const Appbar(title: Text('Brands'), showBackArrow: true),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(AppSize.deafaultspace),
        child: Column(
          children: [
            //heading
            const SectionHeading(
                title: 'All Brands',
                padding: EdgeInsets.zero,
                showActionButton: false),
            const SizedBox(height: AppSize.spaceBtwTtems),
            Obx(() {
              if (controller.isLoading.value) {
                return const BrandShimmer();
              } else if (controller.allBrands.isEmpty) {
                return Center(
                  child: Text('No data',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: Colors.white)),
                );
              }

              return GridLayout(
                  itemCount: controller.allBrands.length,
                  mainAxisExtent: 68,
                  itemBuilder: (_, index) {
                    final brand = controller.allBrands[index];
                    return BrandCard(
                      brand: brand,
                      showBorder: true,
                      onTap: () => Get.to(() =>  BrandProducts(brand: brand)),
                    );
                  });
            }),
          ],
        ),
      )),
    );
  }
}
