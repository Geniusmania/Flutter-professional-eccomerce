import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/features/authentication/login_and_signup/login/controller/login_controller.dart';
import 'package:ui/features/authentication/login_and_signup/pasword/forget_password.dart';
import 'package:ui/features/authentication/login_and_signup/register/register.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/constants/texts.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            TextFormField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                  isDense: true,
                  labelText: AppTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(height: AppSize.spaceBtwInputField),
            Obx(
              () => TextFormField(
                obscureText: controller.hidePassword.value,
                controller: controller.passwordController,
                decoration: InputDecoration(
                  isDense: true,
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: controller.hidePassword.value
                          ? const Icon(Iconsax.eye)
                          : const Icon(Iconsax.eye_slash)),
                  labelText: AppTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                ),
              ),
            ),
            const SizedBox(width: AppSize.spaceBtwInputField / 2),
            //remember me and Forget Password

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: controller.privacyPolicy.value, onChanged: (value)=> controller.privacyPolicy.value=! controller.privacyPolicy.value),
                    const Text(AppTexts.rememberMe),
                  ],
                ),
                // const SizedBox(width: AppSize.spaceBtwSections),
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(AppTexts.forgotPasswordTitle))
              ],
            ),
            //login and signup

            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.login(),
                    child: const Text(AppTexts.login))),
            const SizedBox(height: AppSize.spaceBtwTtems),

            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const RegisterScreen()),
                    child: const Text(AppTexts.register))),
          ],
        ),
      ),
    );
  }
}
