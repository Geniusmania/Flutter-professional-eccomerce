import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/features/authentication/login_and_signup/login.dart';
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
          IconButton(onPressed: ()=> Get.offAll(()=> const LoginScreen()),icon: const Icon(CupertinoIcons.clear),)
        ],
      ),
      body:  Padding(
        padding: EdgeInsets.all(AppSize.deafaultspace),
        child: Column(
          children: [
            //image
            Column(
              children: [Image(image: AssetImage('assets/images/dark.jpg'))],
            ),
        
        
            //message
        Text(AppTexts.confirmEmail)
            //Text(AppTexts.emailVerification)
          ],
        ),
      ),
    );
  }
}
