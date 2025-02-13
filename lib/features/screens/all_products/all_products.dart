import 'package:flutter/material.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../commons/widgets/products/sortable/sortable_products.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Appbar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSize.deafaultspace),
          child: SortedProducts(),
        ),
      ),
    );
  }
}

