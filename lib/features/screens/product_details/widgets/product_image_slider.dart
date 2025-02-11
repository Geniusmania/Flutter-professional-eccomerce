
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../commons/widgets/appbar/appBar.dart';
import '../../../../commons/widgets/icon/circular_icon.dart';
import '../../../../commons/widgets/rounded_image/rounded_image.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../home/widgets/bottomCurve.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return CurvedWidget(
      child: Container(
        color: dark ? AppColors.darkergrey : AppColors.light,
        child: Stack(
          children: [
            const SizedBox(
                height: 400,
                child: Padding(
                  padding:
                  EdgeInsets.all(AppSize.productImageRadius * 2),
                  child: Center(
                      child: Image(
                          image: AssetImage('assets/images/dark.jpg'))),
                )),
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
                    separatorBuilder: (_, __) =>
                    const SizedBox(width: 16),
                    itemCount: 4,
                    itemBuilder: (_, index) => RoundedImage(
                        width: 80,
                        padding: const EdgeInsets.all(AppSize.sm),
                        border: Border.all(color: AppColors.primary),
                        backgroundColor:
                        dark ? AppColors.dark : AppColors.white,
                        imageUrl: 'assets/images/mania.png')),
              ),
            ),

            //................appbar.............//
            const Appbar(
              showBackArrow: true,
              actions: [CircularIcon(icon: Iconsax.heart5,color: Colors.red,)],
            )

          ],
        ),
      ),
    );
  }
}
