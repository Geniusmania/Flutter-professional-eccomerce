import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ui/data/repositories.authentication/authentication_repository.dart';
import 'package:ui/data/repositories.authentication/user_repository.dart';
import 'package:ui/features/authentication/login_and_signup/emailVerification/email_verification.dart';
import 'package:ui/models/usermodel/usermodel.dart';
import 'package:ui/utils/popups/full_screen_loader.dart';
import 'package:ui/utils/popups/loaders.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/images.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final username = TextEditingController();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  Future<void> register() async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog(
          'We are processing your information....', Images.image);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // FullScreenLoader.stopLoading();
        return;
      }
      //form validation
      if (!registerFormKey.currentState!.validate()) {
        // FullScreenLoader.stopLoading();
        return;
      }

      //privacy policy

      if (!privacyPolicy.value) {
        Loaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message: 'Please accept the privacy policy to proceed.');
        return;
      }
      //register user in firebase Auth and save user data in firestore
      final userCredential = await AuthenticationRepository.instance
          .registerUser(email.text.trim(), password.text.trim());

      //save authenticated user data in the firebase
      final newUser = Usermodel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '',
          username: username.text.trim());
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      //show success message
      Loaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue.');
      //move to verify email page

      Get.to(() => const EmailVerification());
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      FullScreenLoader.stopLoading();
    }
  }
}
