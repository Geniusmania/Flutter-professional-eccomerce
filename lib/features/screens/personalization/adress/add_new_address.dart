import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/features/shop/controllers/address_controller.dart';
import 'package:ui/utils/validators/validators.dart';

import '../../../../commons/widgets/appbar/appBar.dart';
import '../../../../utils/constants/sizes.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: Appbar(
        showBackArrow: true,
        title: Text('Add new addresses',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                    controller: controller.nameController,
                    validator: (value) =>
                        Validators.validateEmptytext('Name', value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user), labelText: 'Name')),
                const SizedBox(height: AppSize.spaceBtwInputField),
                TextFormField(
                    controller: controller.phoneController,
                    validator: (value) => Validators.validatePhoneNumber(value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.mobile),
                        labelText: 'Phone Number')),
                const SizedBox(height: AppSize.spaceBtwInputField),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          controller: controller.streetController,
                          validator: (value) =>
                              Validators.validateEmptytext('Street', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.building_31),
                              labelText: 'Street')),
                    ),
                    const SizedBox(width: AppSize.spaceBtwInputField),
                    Expanded(
                      child: TextFormField(
                          controller: controller.postalController,
                          validator: (value) => Validators.validateEmptytext(
                              'Postal code', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.code),
                              labelText: 'Postal Code')),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.spaceBtwInputField),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          controller: controller.cityController,
                          validator: (value) =>
                              Validators.validateEmptytext('City', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.building),
                              labelText: 'City')),
                    ),
                    const SizedBox(width: AppSize.spaceBtwInputField),
                    Expanded(
                      child: TextFormField(
                          controller: controller.stateController,
                          validator: (value) =>
                              Validators.validateEmptytext('State', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.activity),
                              labelText: 'State')),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.spaceBtwInputField),
                TextFormField(
                    validator: (value) =>
                        Validators.validateEmptytext('Country', value),
                    controller: controller.countryController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.global),
                        labelText: 'Country')),
                const SizedBox(height: AppSize.deafaultspace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async{
                      await  controller.addAddress();
                      }, child: const Text('Save')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
