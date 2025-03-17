import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/features/authentication/login_and_signup/login/login.dart';
import 'package:ui/features/authentication/login_and_signup/register/verify_email_controller.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/constants/texts.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key, this.email});
final String? email;
  @override
  Widget build(BuildContext context) {
final controller = Get.put(VerifyEmailController());

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
                  email?? '',
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
                    onPressed: (){},// => controller.checkEmailVerification(),
                        
                    child: const Text(
                      AppTexts.continueButton,
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.spaceBtwTtems,
                ),
                TextButton(
                  onPressed: () {},//controller.sendEmailVerification();},
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
