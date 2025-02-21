import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ui/features/authentication/login_and_signup/emailVerification/email_verification.dart';
import 'package:ui/features/authentication/login_and_signup/login/login.dart';
import 'package:ui/features/authentication/onboarding/onboarding.dart';
import 'package:ui/features/button_navigation_bar/button_nav_bar.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
     deviceStorage.writeIfNull('isFirstTime', true);
       deviceStorage.read('isFirstTime') != true
           ? Get.offAll(() => const LoginScreen())
           : Get.offAll(() => const Onboarding());
   //  screenRedirect();
   // super.onReady();
  }

  // screenRedirect( ) async {
  //   //check if user is authenticated
  //   final user = _auth.currentUser;
  //   if (user != null) {
  //     if (user.emailVerified) {
  //       Get.offAll(() => const ButtonNavBar());
  //     } else {
  //       Get.offAll(() => EmailVerification(
  //             email: _auth.currentUser!.email,
  //           ));

  //       //local storage
  //     }
  //   } else {
  //     deviceStorage.writeIfNull('isFirstTime', true);
  //     deviceStorage.read('isFirstTime') != true
  //         ? Get.offAll(() => const LoginScreen())
  //         : Get.offAll(() => const Onboarding());
  //   }
  // }
//register user
 

//send email verification link
  

  //logout
  }
