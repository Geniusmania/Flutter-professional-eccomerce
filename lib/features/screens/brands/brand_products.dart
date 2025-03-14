import 'package:flutter/material.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/commons/widgets/brands/brand_card.dart';
import 'package:ui/commons/widgets/products/sortable/sortable_products.dart';
import 'package:ui/commons/widgets/shimmer_effect/vertical_product_shimmer.dart';
import 'package:ui/features/shop/controllers/brand_controller.dart';

import '../../../MODEL_NEW/brand_model.dart';
import '../../../utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});
final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return  Scaffold(
      appBar:  Appbar(
        title: Text(brand.name),showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSize.deafaultspace),
          child: Column(
            children: [

              BrandCard(showBorder: true,brand: brand,),
               const SizedBox(height: AppSize.spaceBtwSections),
              FutureBuilder(
                future: controller.getBrandProducts(brand.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No products found for this brand.'));
                  }

                  final brandProducts = snapshot.data!;
                  print("UI received ${brandProducts.length} products");
                  for (var product in brandProducts) {
                    print("Passing to UI: ${product.title}, Brand: ${product.brand?.name}, Brand ID: ${product.brand?.id}");
                  }
                  return Padding(
                    padding: const EdgeInsets.all(0),
                    child: SortedProducts(product: brandProducts),
                  );
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}
