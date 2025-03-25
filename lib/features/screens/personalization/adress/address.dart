import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/features/screens/personalization/adress/add_new_address.dart';
import 'package:ui/features/screens/personalization/adress/widgets/single_address.dart';
import 'package:ui/features/shop/controllers/address_controller.dart';
import 'package:ui/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Iconsax.add,
            color: AppColors.white,
          ),
          onPressed: () => Get.to(() => const AddNewAddress())),
      appBar: Appbar(
        showBackArrow: true,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSize.deafaultspace),
          child: Obx(
            () => FutureBuilder(
                key: Key(controller.refreshData.value.toString()),
                future: controller.getAllAddresses(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData ||
                      snapshot.data == null ||
                      snapshot.data!.isEmpty) {
                    return const Center(child: Text('No addresses added!'));
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text('error!'));
                  }
                  final addresses = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: addresses.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: SingleAddress(
                          address: addresses[index],
                          onTap: () => controller.selectAddress(addresses[index]),
                        ),
                      );
                    },
                  );
                }),
          ),
        ),
      ),
    );
  }
}
