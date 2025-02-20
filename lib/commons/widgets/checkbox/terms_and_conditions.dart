import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/features/authentication/login_and_signup/register/register_controller.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/constants/sizes.dart';

class TermsAndConditionsCheckBox extends StatelessWidget {
  const TermsAndConditionsCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
      final controller = RegisterController.instance;
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
            child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value))),
        const SizedBox(width: AppSize.spaceBtwTtems),
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
                text: 'and ', style: Theme.of(context).textTheme.bodyMedium),
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
    );
  }
}
