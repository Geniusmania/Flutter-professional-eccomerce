import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/features/shop/controllers/user_controller.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/validators/validators.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserUpdate());
    return Scaffold(
      appBar: Appbar(
        showBackArrow: true,
        title: Text('Update Name',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(AppSize.deafaultspace),
        child: Column(
          children: [
            Text('Please enter your new name for easy verification',
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: AppSize.spaceBtwSections),
            Form(
              key: controller.formKey,
                child: Column(
              children: [
                TextFormField(
                 controller:controller.first_name,
                  expands: false,
                  validator: (value) =>
                      Validators.validateEmptytext('First Name', value),
                  decoration: const InputDecoration(
                    isDense: true,
                    labelText: 'First name',
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
                const SizedBox(height: AppSize.spaceBtwSections / 2),
                TextFormField(
                  controller: controller.last_name,
                  expands: false,
                  validator: (value) =>
                      Validators.validateEmptytext('Last Name', value),
                  decoration: const InputDecoration(
                    isDense: true,
                    labelText: 'First name',
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
                const SizedBox(height: AppSize.spaceBtwSections ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: ()=> controller.update(), child: const Text('Update name')),
                )
              ],
            ))
          ],
        ),
      )),
    );
  }
}
