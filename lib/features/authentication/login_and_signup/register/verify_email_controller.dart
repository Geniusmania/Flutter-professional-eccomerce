import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ui/data/repositories.authentication/authentication_repository.dart';
import 'package:ui/features/authentication/login_and_signup/success/success_screen.dart';
import 'package:ui/utils/constants/texts.dart';
import 'package:ui/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();
// final mania = Get.put(AuthenticationRepository());
// send email whenever verify screen appears and set timer for automatic redirection
  @override
  void onInit() {
   // sendEmailVerification();
    //setTimerForAutoRedirect();
    super.onInit();
  }

  //send email verification link
  // void sendEmailVerification() async {
  //   try {
  //     await AuthenticationRepository.instance.sendEmailVerification();
  //     Loaders.successSnackBar(
  //         title: 'Email Sent',
  //         message: 'Please check your email to verify your account');
  //   } catch (e) {
  //     Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  //   }
  // }

  // // timer to automatically redirect on email verification
  // void setTimerForAutoRedirect() async {
  //   Timer.periodic(const Duration(seconds: 5), (timer) async {
  //     await FirebaseAuth.instance.currentUser!.reload();
  //     final user = FirebaseAuth.instance.currentUser;
  //     if (user!.emailVerified ?? false) {
  //       timer.cancel();
  //       Get.off(() => SuccessScreen(
  //             image: 'assets/images/succesful.png',
  //             title: AppTexts.yourAccountCreatedTitle,
  //             subtitle: AppTexts.yourAccountCreatedSubtitle,
  //             onPressed: () {
  //               AuthenticationRepository.instance.screenRedirect();
  //             },
  //           ));
  //     }
  //   });
  // }

  // //manually chech if email is verified

  // void checkEmailVerification() async {
  //  // await FirebaseAuth.instance.currentUser!.reload();
  //   final user = FirebaseAuth.instance.currentUser;
  //   if (user!.emailVerified ?? false) {
  //     Get.off(() => SuccessScreen(
  //           image: 'assets/images/succesful.png',
  //           title: AppTexts.yourAccountCreatedTitle,
  //           subtitle: AppTexts.yourAccountCreatedSubtitle,
  //           onPressed: () {
  //             AuthenticationRepository.instance.screenRedirect();
  //           },
  //         ));
  //   }
  // }
}
