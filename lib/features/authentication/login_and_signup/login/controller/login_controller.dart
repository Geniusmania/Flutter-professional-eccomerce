import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/data/repositories.authentication/authentication_repository.dart';
import 'package:ui/features/button_navigation_bar/button_nav_bar.dart';
import 'package:ui/utils/helpers/network_manager.dart';
import 'package:ui/utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();


  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  RxBool hidePassword = true.obs;
  RxBool privacyPolicy = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  Future<void> login() async {
    try {
      // Start loading
      // FullScreenLoader.openLoadingDialog(
      //     'We are processing your information....', Images.image);
      Get.dialog(
        const Center(child: CircularProgressIndicator(color: Colors.blue)),
        barrierDismissible: false,
      );
      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //FullScreenLoader.stopLoading();
        Loaders.errorSnackBar(
            title: 'Connection Error', message: 'No internet connection.');
        return;
      }

      // Form validation
      if (!loginFormKey.currentState!.validate()) {
        //FullScreenLoader.stopLoading();
        Loaders.errorSnackBar(title: 'Validation Error',
            message: 'Please fill all required fields.');
        return;
      }

      // // Privacy policy check
      // if (!privacyPolicy.value) {
      //  // FullScreenLoader.stopLoading();
      //   Loaders.warningSnackBar(
      //       title: 'Accept Privacy Policy',
      //       message: 'Please accept the privacy policy to proceed.');
      //   return;
      // }

      await AuthenticationRepository.instance.login(
          emailController.text.trim(), passwordController.text.trim());
      Get.back();
      Loaders.successSnackBar(
          title: 'Welcome',
          message: 'Have an amazing shopping experience');

      // Navigate to verification page
      Get.to(() => const ButtonNavBar());
    } catch (e) {
      //  FullScreenLoader.stopLoading();
      Get.back();
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      if (kDebugMode) {
        print('login error: $e');
      }
    }
  }


}