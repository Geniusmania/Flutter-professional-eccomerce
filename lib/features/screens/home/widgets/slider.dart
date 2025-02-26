import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/commons/widgets/rounded_image/rounded_image.dart';
import 'package:ui/features/screens/home/widgets/circular_container.dart';
import 'package:ui/features/shop/controllers/banner_controller.dart';
import 'package:ui/features/shop/controllers/homeController.dart';
import 'package:ui/utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Column(
      children: [
        CarouselSlider(
            items: controller.allBanners
                .map((allBanners){
print(allBanners.imageUrl);
                  final fixedImageUrl = allBanners.imageUrl.replaceFirst('http://localhost:3000', 'http://192.168.30.95:3000');
                  return RoundedImage(
                      fit: BoxFit.cover,
                      imageUrl: fixedImageUrl,
                      isNetworkImage: true,
                    );})
                .toList(),
            options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index))),
        const SizedBox(height: AppSize.spaceBtwTtems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < controller.allBanners.length; i++)
                  CircularTransParentCard(
                    height: 4,
                    width: 20,
                    color: controller.carouselCurrentIndex.value == i
                        ? Colors.blue
                        : Colors.grey,
                    margin: const EdgeInsets.only(left: 8),
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}
