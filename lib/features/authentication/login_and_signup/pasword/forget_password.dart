import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/features/authentication/login_and_signup/login/login.dart';
import 'package:ui/features/authentication/login_and_signup/pasword/reset_password.dart';
import 'package:ui/utils/constants/texts.dart';

import '../../../../utils/constants/sizes.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> Get.off(()=> const LoginScreen()), icon:const Icon(CupertinoIcons.clear,),),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.all(AppSize.deafaultspace),
        child: Column(
          children: [

Text(AppTexts.forgotPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSize.deafaultspace),
            Text(AppTexts.resetPasswordSubtitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center),
            const SizedBox(
              height: AppSize.spaceBtwTtems,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: 'Email',
                isDense: true,
                  border: OutlineInputBorder(),),
            ),
            const SizedBox(
              height: AppSize.spaceBtwTtems,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.off(() => const ResetPassword()),
                  child: const Text(AppTexts.resetPasswordButton)),
            ),


          ],
        ),
      ))),
    );
  }
}
