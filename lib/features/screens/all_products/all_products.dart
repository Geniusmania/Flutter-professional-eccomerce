import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/data/repositories.authentication/product_repository.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../MODEL_NEW/product_model.dart';
import '../../../commons/widgets/products/sortable/sortable_products.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, this.query, required this.title, this.futureMethod});

  final Query? query;
  final String title;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductRepository());
    return Scaffold(
      appBar: const Appbar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSize.deafaultspace),
          child: FutureBuilder(
            future: futureMethod ?? controller.getProducts(),
            builder: (BuildContext context,
                AsyncSnapshot<List<ProductModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator()); // Show loading state
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}')); // Show error message
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No products found.')); // Handle empty response
              }
              return  SortedProducts(product: snapshot.data!);
            },
          ),
        ),
      ),
    );
  }
}
