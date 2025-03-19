import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ui/data/repositories.authentication/authentication_repository.dart';
import 'package:ui/features/authentication/login_and_signup/emailVerification/email_verification.dart';
import 'package:ui/utils/popups/full_screen_loader.dart';
import 'package:ui/utils/popups/loaders.dart';
import '../../../../utils/helpers/network_manager.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final first_name = TextEditingController();
  final last_name = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final username = TextEditingController();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

Future<void> register() async {
  try {
    // Start loading
    // FullScreenLoader.openLoadingDialog(
    //     'We are processing your information....', Images.image);

    // Check internet connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      //FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Connection Error', message: 'No internet connection.');
      return;
    }

    // Form validation
    if (!registerFormKey.currentState!.validate()) {
      //FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Validation Error', message: 'Please fill all required fields.');
      return;
    }

    // Privacy policy check
    if (!privacyPolicy.value) {
     // FullScreenLoader.stopLoading();
      Loaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'Please accept the privacy policy to proceed.');
      return;
    }

    // Registration
     await AuthenticationRepository.instance.registerUser(
      phoneNumber.text.trim(),
      email.text.trim(),
      password.text.trim(),
      first_name.text.trim(),
      last_name.text.trim(),
      username.text.trim(),
    );

   // if (user != null) {
      // Remove loader
      //FullScreenLoader.stopLoading();

      // Show success message
      Loaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue.');

      // Navigate to verification page
      Get.to(() => EmailVerification(email: email.text.trim()));
   // }
  } catch (e) {
    FullScreenLoader.stopLoading();
    Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    if (kDebugMode) {
      print('Registration error: $e');
    }
  }
}

}
