import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/features/authentication/onboarding/onboarding_controller/onboarding.comtroller.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/devices/device_utility.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

class OnboardingNext extends StatelessWidget {
  const OnboardingNext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = HelperFunctions.isDarkMode(context);
    return Positioned(
      right: AppSize.deafaultspace,
      bottom: DeviceUtility.getBottomNavigationBarHeight()-25,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(shape: const CircleBorder(),backgroundColor: dark? AppColors.primary: Colors.black),
        onPressed: ()=> OnboardingController.instance.nextPage(), child: const Icon(Iconsax.arrow_right_3,color: Colors.white,)),
    );
  }
}
