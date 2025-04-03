import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ui/commons/widgets/roudedContainer/rounded_container.dart';
import 'package:ui/commons/widgets/sectionHeader/section_header.dart';
import 'package:ui/features/shop/controllers/checkout_controller.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SectionHeading(
            padding: EdgeInsets.zero,
            title: 'Payment Method',
            buttonTitle: 'Change',
            onPressed: () => controller.selectPaymentMethod(context)),
        const SizedBox(height: AppSize.spaceBtwTtems / 2),
        Obx(()=>Row(
            children: [
               RoundedContainer(
                  width: 60,
                  height: 35,
                  backgroundColor: dark ? AppColors.light : AppColors.white,
                  child: Image(
                    image:
                        AssetImage(controller.selectedPaymentMethod.value.image),
                    fit: BoxFit.cover,
                  ),
                ),

              const SizedBox(width: AppSize.spaceBtwTtems / 2),
              Text(controller.selectedPaymentMethod.value.name,
                  style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        )
      ],
    );
  }
}
