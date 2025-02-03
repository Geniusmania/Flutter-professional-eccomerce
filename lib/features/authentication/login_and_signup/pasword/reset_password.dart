import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/features/authentication/login_and_signup/login/login.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/constants/texts.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSize.deafaultspace),
          child: Column(
            children: [
              const Column(
                children: [
                  Image(image: AssetImage('assets/images/My_loGo.PNG'))
                ],
              ),
              const SizedBox(height: AppSize.spaceBtwSections),

              //message
              Text(
                AppTexts.resetPasswordSuccessTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSize.deafaultspace),

              Text(AppTexts.resetPasswordSuccessSubtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: AppSize.deafaultspace),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.off(() => const LoginScreen()),
                  child: const Text(
                    AppTexts.continueButton,
                  ),
                ),
              ),              const SizedBox(height: AppSize.deafaultspace),


              TextButton(
                  onPressed: () {},
                  child: const Text(
                    AppTexts.resendEmail,
                  ),)
            ],
          ),
        ),
      ),
    );
  }
}
