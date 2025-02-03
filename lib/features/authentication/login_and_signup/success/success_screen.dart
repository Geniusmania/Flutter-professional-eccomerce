import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/features/authentication/login_and_signup/login/login.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/constants/texts.dart';

class SuccessScreen extends StatelessWidget {
  final String image, title, subtitle;
final  VoidCallback? onPressed;
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.all(AppSize.deafaultspace),
          child: Column(
            children: [
               Column(
                children: [
                  Image(image: AssetImage(image))
                ],
              ),

              //message
              Text(
                AppTexts.yourAccountCreatedTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSize.deafaultspace),

              Text(AppTexts.yourAccountCreatedSubtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: AppSize.deafaultspace),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const LoginScreen()),
                  child: const Text(
                    AppTexts.continueButton,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
