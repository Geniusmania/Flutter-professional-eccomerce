import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ui/commons/widgets/sectionHeader/section_header.dart';
import 'package:ui/features/shop/controllers/address_controller.dart';

import '../../../../utils/constants/sizes.dart';

class BillingAddress extends StatelessWidget {
  const BillingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Obx(()=>Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeading(
              padding: EdgeInsets.zero,
              title: 'Shipping Address',
              buttonTitle: 'Change',
              onPressed: ()=> controller.selectNewAddress(context)),
          controller.selectedAddress.value.id.isNotEmpty?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.selectedAddress.value.name, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: AppSize.spaceBtwTtems / 2),
              Row(
                children: [
                  const Icon(Icons.phone, color: Colors.grey, size: 16),
                  const SizedBox(width: AppSize.spaceBtwTtems),
                  Text(controller.selectedAddress.value.phoneNumber,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              const SizedBox(height: AppSize.spaceBtwTtems / 2),
              Row(
                children: [
                  const Icon(Icons.location_history, color: Colors.grey, size: 16),
                  const SizedBox(width: AppSize.spaceBtwTtems),
                  Text(controller.selectedAddress.value.toString(),
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              const SizedBox(height: AppSize.spaceBtwTtems / 2),
            ],
          ): Text('Select Address',style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
