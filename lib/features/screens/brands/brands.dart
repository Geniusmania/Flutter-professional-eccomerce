import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/commons/widgets/brands/brand_card.dart';
import 'package:ui/commons/widgets/layouts/gridLayout/grid_layout.dart';
import 'package:ui/features/screens/brands/brand_products.dart';
import 'package:ui/utils/constants/sizes.dart';

import '../../../commons/widgets/sectionHeader/section_header.dart';

class Brands extends StatelessWidget {
  const Brands({super.key});

  @override
  Widget build(BuildContext context) {
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
            GridLayout(
              itemCount: 20,
              mainAxisExtent: 80,
              itemBuilder: (_, index) => BrandCard(
                showBorder: true,
                onTap: () => Get.to(() => const BrandProducts()),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
