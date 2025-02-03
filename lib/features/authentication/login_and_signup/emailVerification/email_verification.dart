import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/features/authentication/login_and_signup/login/login.dart';
import 'package:ui/features/authentication/login_and_signup/success/success_screen.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/constants/texts.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSize.deafaultspace),
            child: Column(
              children: [
                //image
                const Column(
                  children: [
                    Image(image: AssetImage('assets/images/My_loGo.PNG'))
                  ],
                ),

                //message
                Text(
                  AppTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSize.deafaultspace),
                Text(
                  'geniusmania@gmail.com',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSize.deafaultspace),

                Text(AppTexts.confirmEmailSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: AppSize.spaceBtwTtems,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => SuccessScreen(
                          image: 'assets/images/My_loGo.PNG',
                          title: AppTexts.yourAccountCreatedTitle,
                          subtitle: AppTexts.yourAccountCreatedSubtitle,
                          onPressed: () => Get.to(() => const LoginScreen()),
                        )),
                    child: const Text(
                      AppTexts.continueButton,
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.spaceBtwTtems,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    AppTexts.resendEmail,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
