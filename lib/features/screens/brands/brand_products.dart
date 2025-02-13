import 'package:flutter/material.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/commons/widgets/brands/brand_card.dart';
import 'package:ui/commons/widgets/products/sortable/sortable_products.dart';

import '../../../utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Appbar(
        title: Text('Nike'),showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSize.deafaultspace),
          child: Column(
            children: [

              BrandCard(showBorder: true),
               SizedBox(height: AppSize.spaceBtwSections),
              SortedProducts()
            ],
          ),
        ),
      ),
    );
  }
}
