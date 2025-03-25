import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/commons/widgets/roudedContainer/rounded_container.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

import '../../../../../MODEL_NEW/address_model.dart';
import '../../../../shop/controllers/address_controller.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.address, required this.onTap});


  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = AddressController.instance;
    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId==address.id;
      return
        InkWell(onTap: onTap,
          child: RoundedContainer(
            padding: const EdgeInsets.all(AppSize.md),
            width: double.infinity,
            showBorder: true,
            backgroundColor: selectedAddress
                ? AppColors.primary.withValues(alpha: 0.5)
                : Colors.transparent,
            borderColor: selectedAddress
                ? Colors.transparent
                : dark
                ? AppColors.darkergrey
                : AppColors.grey,
            //margin: const EdgeInsets.only(bottom: AppSize.spaceBtwTtems),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 5,
                  child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                      color: selectedAddress
                          ? dark
                          ? AppColors.light
                          : AppColors.dark.withValues(alpha: 0.6)
                          : null),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(address.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleLarge),
                    const SizedBox(height: AppSize.sm / 2),
                     Text(address.phoneNumber,
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: AppSize.sm / 2),
                    Text(
                      address.toString(),
                      softWrap: true,
                      maxLines: 1,
                    )
                  ],
                )
              ],
            ),
          ),
        );
    });
  }
}
