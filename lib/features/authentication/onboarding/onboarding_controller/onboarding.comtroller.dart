import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../login_and_signup/login/login.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  final PageController pageController = PageController();
  Rx<int> currentPage = 0.obs;

  void updatePageIndicator(index) => currentPage.value = index;

  void dotNavigationClick(index) {
    currentPage.value = index;
    pageController.jumpToPage(index);
  }

  void nextPage() {
    if (currentPage.value == 2) {
      final storage = GetStorage();
      storage.write("isFirstTime", false);
      Get.offAll(() => const LoginScreen());
    } else {
      int page = currentPage.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage() {
    currentPage.value = 2;
    pageController.jumpToPage(2);
  }

  @override
  void onClose() {
    pageController.dispose(); // Prevent memory leak
    super.onClose();
  }
}
