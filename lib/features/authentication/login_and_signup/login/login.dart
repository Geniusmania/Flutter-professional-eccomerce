import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/features/authentication/login_and_signup/widgets/login_devider.dart';
import 'package:ui/features/authentication/login_and_signup/widgets/login_form.dart';
import 'package:ui/features/authentication/login_and_signup/widgets/login_logo.dart';
import 'package:ui/features/authentication/login_and_signup/widgets/login_socials.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/constants/texts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSize.deafaultspace),
            child: Column(
              children: [
                //logo and login text
                const LoginLogo(),
                const SizedBox(height: AppSize.spaceBtwSections),
        
                //login form
        
                const LoginForm(),
                //Divider
                        const SizedBox(height: AppSize.spaceBtwSections),

                LoginDivider(dividerText: AppTexts.orloginWith.capitalize!,),
                const SizedBox(height: AppSize.spaceBtwSections),
                const LoginSocials()
                //google and facebook
              ],
            ),
          ),
        ),
      ),
    );
  }
}
