import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/MODEL_NEW/product_model.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/commons/widgets/icon/circular_icon.dart';
import 'package:ui/commons/widgets/layouts/gridLayout/grid_layout.dart';
import 'package:ui/commons/widgets/products/products_cards/product_card_vertical.dart';
import 'package:ui/features/screens/home/home_screen.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return  Scaffold(
      appBar: Appbar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [CircularIcon(icon: Iconsax.add,color: dark? AppColors.white: AppColors.dark, onPressed: ()=> Get.to(const HomeScreen()))]
      ),
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          GridLayout(itemCount: 6, itemBuilder: (_, index)=> ProductCardVertical(product:ProductModel.empty() ,))

        ],),
      ),),
    );
  }
}