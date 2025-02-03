import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/features/authentication/login_and_signup/login.dart';

class OnboardingController {
  static OnboardingController get instance => Get.find();

  //variables
  final pageController = PageController();
  Rx<int> currentPage = 0.obs;
//update page
  void updatePageIndicator(index) => currentPage.value = index;

//go to selected dot index
  void dotNavigationClick(index) {
    currentPage.value = index;
    pageController.jumpToPage(index);
  }
  void nextPage() {
    if(currentPage.value ==2){
      Get.offAll(()=>const LoginScreen());
    }else{
      int page = currentPage.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage() {
    currentPage.value = 2;
    pageController.jumpToPage(2);
  }
}
