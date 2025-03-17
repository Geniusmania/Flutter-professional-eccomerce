import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/MODEL_NEW/product_model.dart';
import 'package:ui/commons/widgets/favourite_icon/favourite_icon.dart';
import 'package:ui/features/shop/controllers/product_detail_controller.dart';
import '../../../../commons/widgets/appbar/appBar.dart';
import '../../../../commons/widgets/rounded_image/rounded_image.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../home/widgets/bottomCurve.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(ProductDetailController());
    final images = controller.fetchAllProductDetails(product);
    return CurvedWidget(
      child: Container(
        color: dark ? AppColors.darkergrey : AppColors.light,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () => controller
                  .previewProductImage(controller.selectedProductImage.value),
              child: SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(AppSize.productImageRadius * 2),
                  child: Center(
                    child: Obx(
                      () => CachedNetworkImage(
                        imageUrl: controller.selectedProductImage.value,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 30,
              left: AppSize.deafaultspace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemCount: images.length,
                  itemBuilder: (_, index) => Obx(() {
                    final isSelected =
                        controller.selectedProductImage.value == images[index];
                    return RoundedImage(
                        onTap: () => controller.selectedProductImage.value =
                            images[index],
                        isNetworkImage: true,
                        width: 80,
                        padding: const EdgeInsets.all(AppSize.sm),
                        border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : Colors.transparent),
                        backgroundColor:
                            dark ? AppColors.dark : AppColors.white,
                        imageUrl: images[index]);
                  }),
                ),
              ),
            ),

            //................appbar.............//
            const Appbar(
              showBackArrow: true,
              actions: [FavouriteIcon()],
            )
          ],
        ),
      ),
    );
  }
}
