import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

import '../constants/sizes.dart';

class AnimationLoaderWidget extends StatelessWidget {
  const AnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.actionText,
       this.showAction =false,
      this.onActionPressed});

  final String text, animation;
  final String? actionText;
  final bool showAction;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Lottie.asset(animation,
                width: HelperFunctions.screenSize(context).width * 0.8),
            const SizedBox(height: AppSize.deafaultspace),
            Text(text,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: AppSize.deafaultspace),
            showAction
                ? SizedBox(
                    width: 250,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: AppColors.dark),
                        onPressed: onActionPressed,
                        child: Text(
                          actionText!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .apply(color: AppColors.light),
                        )),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

