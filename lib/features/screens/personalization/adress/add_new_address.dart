import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../commons/widgets/appbar/appBar.dart';
import '../../../../utils/constants/sizes.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user), labelText: 'Name')),
                const SizedBox(height: AppSize.spaceBtwInputField),
                TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.mobile),
                        labelText: 'Phone Number')),
                const SizedBox(height: AppSize.spaceBtwInputField),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.building_31), labelText: 'Street')),
                    ),
                    const SizedBox(width: AppSize.spaceBtwInputField),
                    Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code')),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.spaceBtwInputField),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.building), labelText: 'City')),
                    ),
                    const SizedBox(width: AppSize.spaceBtwInputField),
                    Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.activity), labelText: 'State')),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.spaceBtwInputField),
                TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.global), labelText: 'Country')),
                const SizedBox(height: AppSize.deafaultspace),
                 SizedBox(width: double.infinity,
                child: ElevatedButton(onPressed: (){}, child: const Text('Save')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
