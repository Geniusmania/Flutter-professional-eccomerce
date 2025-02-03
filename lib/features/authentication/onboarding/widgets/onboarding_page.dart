import 'package:flutter/material.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/helpers/helper_functions.dart';



class OnboardingPage extends StatelessWidget {
  final String image, title, subTitle;
  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.deafaultspace),
      child: Column(
        children: [
      
          Image(
              width: HelperFunctions.screenWidth(context) * 0.8,
              height: HelperFunctions.screenHeight(context) * 0.6,
              image: AssetImage(image)),
          const SizedBox(height: AppSize.spaceBtwTtems),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSize.spaceBtwTtems),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
