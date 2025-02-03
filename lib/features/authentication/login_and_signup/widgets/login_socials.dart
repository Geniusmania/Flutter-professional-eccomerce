import 'package:flutter/material.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/constants/sizes.dart';

class LoginSocials extends StatelessWidget {
  const LoginSocials({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: AppSize.iconSm,
                  height: AppSize.iconSm,
    
                  //google logo
                  image: AssetImage('assets/images/google.png'))),
        ),
        const SizedBox(
          width: AppSize.spaceBtwTtems,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: AppSize.iconSm,
                  height: AppSize.iconSm,
    
                  //facebook logo
                  image: AssetImage('assets/images/fb.png'))),
        ),
      ],
    );
  }
}
