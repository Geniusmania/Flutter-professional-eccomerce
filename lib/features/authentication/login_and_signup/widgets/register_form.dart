import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/commons/widgets/checkbox/terms_and_conditions.dart';
import 'package:ui/features/authentication/login_and_signup/register/register_controller.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/constants/texts.dart';
import 'package:ui/utils/helpers/helper_functions.dart';
import 'package:ui/utils/validators/validators.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(RegisterController());
    return Form(
      key: controller.registerFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                controller: controller.first_name,
                validator: (value) =>
                    Validators.validateEmptytext('First name', value),
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
                  controller: controller.last_name,
                  validator: (value) =>
                      Validators.validateEmptytext('Last name', value),
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
            controller: controller.username,
            validator: (value) =>
                Validators.validateEmptytext('Username', value),
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
            controller: controller.email,
            validator: (value) => Validators.validateEmail(value),
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
            controller: controller.phoneNumber,
            validator: (value) => Validators.validatePhoneNumber(value),
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
          Obx(
            () => TextFormField(
              obscureText: controller.hidePassword.value,
              controller: controller.password,
              validator: (value) => Validators.validatePassword(value),
              expands: false,
              decoration: InputDecoration(
                  isDense: true,
                  border: const OutlineInputBorder(),
                  labelText: AppTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye
                          : Iconsax.eye_slash))),
            ),
          ),
          const SizedBox(height: AppSize.spaceBtwInputField),
          const TermsAndConditionsCheckBox(),
          const SizedBox(height: AppSize.spaceBtwInputField),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () { controller.register();
              //  Get.to(()=> const EmailVerification());
                },
                child: const Text('Sign Up')),
          ),
        ],
      ),
    );
  }
}
