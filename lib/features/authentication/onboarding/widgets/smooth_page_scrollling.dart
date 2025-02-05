import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ui/features/authentication/onboarding/onboarding_controller/onboarding.comtroller.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/devices/device_utility.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

class SmoothPage extends StatelessWidget {
const  SmoothPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    final dark = HelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: DeviceUtility.getBottomNavigationBarHeight()-25,
        left: AppSize.deafaultspace,
        child: SmoothPageIndicator(
            controller: controller.pageController,
            onDotClicked: controller.dotNavigationClick,
            effect: ExpandingDotsEffect(
                activeDotColor: dark ? AppColors.light : AppColors.primary,
                dotHeight: 6),
            count: 3));
  }
}