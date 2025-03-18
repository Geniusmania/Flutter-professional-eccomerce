import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

class Loaders {
  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: AppColors.white,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(5),
        icon: const Icon(Iconsax.warning_2, color: AppColors.white));
  }

  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: AppColors.white,
        backgroundColor: Colors.green,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(5),
        snackPosition: SnackPosition.BOTTOM,
        icon: const Icon(
          Iconsax.check,
          color: Colors.white,
        ));
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: AppColors.white,
        backgroundColor: Colors.red.shade600,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(5),
        icon: const Icon(Iconsax.warning_2, color: AppColors.white));
  }

  static customToast({required message}) {
    final dark = HelperFunctions.isDarkMode(Get.context!);
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      elevation: 0,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: dark
                ? AppColors.darkergrey.withValues(alpha: 0.9)
                : AppColors.grey.withValues(alpha: 0.9)),
        child: Center(
          child:
              Text(message, style: Theme.of(Get.context!).textTheme.labelLarge),
        ),
      ),
    ));
  }
}
