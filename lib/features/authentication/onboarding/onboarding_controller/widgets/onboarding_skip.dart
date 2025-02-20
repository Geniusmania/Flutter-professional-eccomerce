import 'package:flutter/material.dart';
import 'package:ui/features/authentication/onboarding/onboarding_controller/onboarding.comtroller.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/devices/device_utility.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final controller = OnboardingController.instance;
    return Positioned(
      top: DeviceUtility.getAppBarHeight(),
      right: AppSize.deafaultspace,
      child: TextButton(onPressed:()=>OnboardingController.instance.skipPage(), child:const Text('Skip')));
  }
}