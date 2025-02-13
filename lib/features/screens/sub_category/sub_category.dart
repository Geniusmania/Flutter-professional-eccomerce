import 'package:flutter/material.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/commons/widgets/products/products_cards/product_card_horizontal.dart';
import 'package:ui/commons/widgets/rounded_image/rounded_image.dart';
import 'package:ui/commons/widgets/sectionHeader/section_header.dart';
import 'package:ui/utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class SubCategory extends StatelessWidget {
  const SubCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final height = HelperFunctions.screenHeight(context);
    return Scaffold(
      appBar: const Appbar(
        title: Text('Sports'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSize.deafaultspace),
          child: Column(
            children: [
              RoundedImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: height * 0.25,
                  applyImageRadius: true,
                  imageUrl: 'assets/images/shoe1.jpg'),
              const SizedBox(height: AppSize.spaceBtwSections),
              SectionHeading(
                title: 'Sports Shirts',
                onPressed: () {},
                padding: EdgeInsets.zero,
              ),
              const SizedBox(height: AppSize.deafaultspace / 2),
              SizedBox(height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index)=> const SizedBox(width: 16,),
                  itemCount: 5,
                  itemBuilder: (_,index)=> const  ProductCardHorizontal(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
