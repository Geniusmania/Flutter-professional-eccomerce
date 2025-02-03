import 'package:flutter/material.dart';
import 'package:ui/features/authentication/login_and_signup/widgets/login_devider.dart';
import 'package:ui/features/authentication/login_and_signup/widgets/login_socials.dart';
import 'package:ui/features/authentication/login_and_signup/widgets/register_form.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/constants/texts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSize.deafaultspace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //header text
                Text(AppTexts.registerTitle,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: AppSize.spaceBtwSections),
                //Form
                const RegisterForm(),
                const SizedBox(height: AppSize.spaceBtwTtems),
                //divider
                const LoginDivider(dividerText: 'Or Signup With'),
                const SizedBox(height: AppSize.spaceBtwTtems),

                const LoginSocials()

                //socials
              ],
            ),
          ),
        ),
      ),
    );
  }
}

