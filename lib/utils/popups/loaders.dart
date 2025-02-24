import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/utils/constants/colors.dart';

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
}
