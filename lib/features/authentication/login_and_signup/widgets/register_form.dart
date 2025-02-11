
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/features/authentication/login_and_signup/emailVerification/email_verification.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/constants/texts.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
                child: TextFormField(
              expands: false,
              decoration: const InputDecoration(
                isDense: true,
                prefixIcon: Icon(Iconsax.user),
                border: OutlineInputBorder(),
                labelText: AppTexts.firstname,
              ),
            )),
            const SizedBox(
              width: AppSize.spaceBtwInputField,
            ),
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                  isDense: true,
                    border: OutlineInputBorder(),
                    labelText: AppTexts.lastname,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: AppSize.spaceBtwInputField,
        ),
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
            isDense: true,
              border: OutlineInputBorder(),
              labelText: AppTexts.userName,
              prefixIcon: Icon(Iconsax.user_cirlce_add)),
        ),
        const SizedBox(
          height: AppSize.spaceBtwInputField,
        ),
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
            isDense: true,
              border: OutlineInputBorder(),
              labelText: AppTexts.email,
              prefixIcon: Icon(Iconsax.message_add)),
        ),
        const SizedBox(
          height: AppSize.spaceBtwInputField,
        ),
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
            isDense: true,
              border: OutlineInputBorder(),
              labelText: AppTexts.phone,
              prefixIcon: Icon(Iconsax.call)),
        ),
        const SizedBox(
          height: AppSize.spaceBtwInputField,
        ),
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
            isDense: true,
              border: OutlineInputBorder(),
              labelText: AppTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash)),
        ),
        const SizedBox(
          height: AppSize.spaceBtwInputField,
        ),
        Row(
          children: [
            SizedBox(child: Checkbox(value: true, onChanged: (value) {})),
            const SizedBox(height: AppSize.spaceBtwTtems),
            Text.rich(TextSpan(children: [
              TextSpan(children: [
                TextSpan(
                    text: 'I agree to ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'privacy terms ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: dark ? AppColors.white : AppColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            dark ? AppColors.white : AppColors.primary)),
                TextSpan(
                    text: 'and ',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text: 'conditions',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: dark ? AppColors.white : AppColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            dark ? AppColors.white : AppColors.primary))
              ])
            ]))
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: () =>Get.to(()=> const EmailVerification() ), child: const Text('Sign Up')),
        ),
    
      ],
    );
  }
}