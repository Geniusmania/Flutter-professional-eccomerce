import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/features/authentication/login_and_signup/pasword/forget_password.dart';
import 'package:ui/features/authentication/login_and_signup/register/register.dart';
import 'package:ui/features/button_navigation_bar/button_nav_bar.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/constants/texts.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            TextFormField(
              
              decoration: const InputDecoration(
                isDense: true,
                  labelText: AppTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(height: AppSize.spaceBtwInputField),
            TextFormField(
              decoration: const InputDecoration(
                isDense: true,
                suffixIcon: Icon(Iconsax.eye_slash),
                labelText: AppTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
              ),
            ),
            const SizedBox(width: AppSize.spaceBtwInputField / 2),
            //remember me and Forget Password

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(AppTexts.rememberMe),
                  ],
                ),
                // const SizedBox(width: AppSize.spaceBtwSections),
                TextButton(
                    onPressed: ()=> Get.to(()=> const ForgetPassword()),
                    child: const Text(AppTexts.forgotPasswordTitle))
              ],
            ),
            //login and signup

            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: ()=> Get.to(()=>const ButtonNavBar()), child: const Text(AppTexts.login))),
            const SizedBox(height: AppSize.spaceBtwTtems),

            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: ()=> Get.to(()=> const RegisterScreen()), child: const Text(AppTexts.register))),
          ],
        ),
      ),
    );
  }
}
