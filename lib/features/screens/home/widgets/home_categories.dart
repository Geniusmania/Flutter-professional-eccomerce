import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/commons/widgets/widget_Image/common_widget_image.dart';
import 'package:ui/features/screens/sub_category/sub_category.dart';
import 'package:ui/features/shop/controllers/category_controller.dart';

import '../../../../commons/widgets/shimmer_effect/category_shimer.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const CategoryShimmer();
      }

      if (controller.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data Found!',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }

      return SizedBox(
        height: 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: controller.featuredCategories.length,
          itemBuilder: (_, int index) {
            final category = controller.featuredCategories[index];
            return VerticalImageText(

              isNetWorkImage: true,
              image: category.imageUrl,
              title: category.name,
              onTap: () => Get.to(() =>  SubCategoryScreen(category: category)),
            );
          },
        ),
      );
    });
  }
}
