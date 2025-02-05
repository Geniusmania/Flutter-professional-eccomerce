import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/commons/widgets/rounded_image/rounded_image.dart';
import 'package:ui/features/screens/home/widgets/circular_container.dart';
import 'package:ui/features/shop/controllers/homeController.dart';
import 'package:ui/utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {
  final List<String> banners;
  const PromoSlider({
    super.key, required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Homecontroller());
    return Column(
      children: [
        CarouselSlider(items: banners.map((url)=>RoundedImage(fit: BoxFit.cover,imageUrl: url)).toList(),
          
        options: CarouselOptions(viewportFraction: 1,onPageChanged: (index, _)=> controller.updatePageIndicator(index)  )),
        const SizedBox(height: AppSize.spaceBtwTtems),
        Center(
          child: Obx(()=> Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                   CircularTransParentCard(
                    height: 4,
                    width: 20,
                    color: controller.carouselCurrentIndex.value==i? Colors.blue: Colors.grey,
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
