import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/features/authentication/onboarding/onboarding_controller/onboarding.comtroller.dart';
import 'package:ui/features/authentication/onboarding/widgets/onboarding_next.dart';
import 'package:ui/features/authentication/onboarding/widgets/onboarding_page.dart';
import 'package:ui/features/authentication/onboarding/widgets/onboarding_skip.dart';
import 'package:ui/features/authentication/onboarding/widgets/smooth_page_scrollling.dart';
import 'package:ui/utils/constants/texts.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
   final controller = Get.put(OnboardingController());
    return Scaffold(
        body: Stack(children: [
      PageView(
       controller: controller.pageController,
       onPageChanged: controller.updatePageIndicator,
        children: const [
          OnboardingPage(
            image: 'assets/images/My_loGo.PNG',
            title: AppTexts.onboardingTitle1,
            subTitle: AppTexts.onboardingSubtitle1,
          ),
          OnboardingPage(
            image: 'assets/images/My_loGo.PNG',
            title: AppTexts.onboardingTitle2,
            subTitle: AppTexts.onboardingSubtitle2,
          ),
          OnboardingPage(
            image: 'assets/images/My_loGo.PNG',
            title: AppTexts.onboardingTitle3,
            subTitle: AppTexts.onboardingSubtitle3,
          ),
        ],
      ),

      //skip button
      const OnboardingSkip(),

      //Scrolling(smooth-page)
      const SmoothPage(),


      //cirCular button

     const OnboardingNext()
    ]));
  }
}



