import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

class LoginDivider extends StatelessWidget {
  final String dividerText;
  const LoginDivider({
    super.key, required this.dividerText,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = HelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
                thickness: 0.5,
                indent: 5,
                endIndent: 60,
                color: dark ? AppColors.lightgrey : AppColors.darkgrey)),
         Text(dividerText),
        Flexible(
            child: Divider(
                thickness: 0.5,
                indent: 60,
                endIndent: 5,
                color: dark ? AppColors.lightgrey : AppColors.darkgrey)),
      ],
    );
  }
}
