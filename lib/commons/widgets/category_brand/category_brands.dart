import 'package:flutter/material.dart';
import 'package:ui/MODEL_NEW/category_model.dart';
import 'package:ui/MODEL_NEW/product_model.dart';
import 'package:ui/commons/widgets/shimmer_effect/brand_shimmer.dart';

import '../../../features/shop/controllers/brand_controller.dart';
import '../brandshowcase/brand_show_case.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;



  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandForCategory(category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const BrandShimmer();
          } else if (snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data == null) {
            return const Center(child: Text('No data'));
          }

          final brands = snapshot.data!;

          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: brands.length,
              itemBuilder: (_, index) {
                final brand = brands[index];
                return  FutureBuilder(
                  future: controller.getBrandProducts(brand.id),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const BrandShimmer();
                    } else if (snapshot.hasError ||
                        !snapshot.hasData ||
                        snapshot.data == null) {
                      return const Center(child: Text('No data'));
                    }
                    final products = snapshot.data!;
                    return BrandShowcase(
                      images: products.map((e)=> e.thumbnail).toList(), brand: brand,
                    );
                  }
                );
              });
        });
  }
}
