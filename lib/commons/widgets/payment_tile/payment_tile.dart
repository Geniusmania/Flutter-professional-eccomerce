import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/MODEL_NEW/payment_method_model.dart';
import 'package:ui/commons/widgets/roudedContainer/rounded_container.dart';
import 'package:ui/features/shop/controllers/checkout_controller.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class PaymentTile extends StatelessWidget {
  const PaymentTile({super.key, required this.paymentMethod});
final PaymentMethodModel paymentMethod;
  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: (){
        controller.selectedPaymentMethod.value = paymentMethod;

        Get.back();
      },

      leading: RoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: HelperFunctions.isDarkMode(context)? AppColors.light: AppColors.white,
        padding: const EdgeInsets.all(AppSize.sm),
 child: Image(image: AssetImage(paymentMethod.image),fit: BoxFit.contain),     ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}
