import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/features/shop/controllers/user_profile_controller.dart';

import '../../../../features/containers/circular_container.dart';
import '../../../../utils/constants/colors.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key, this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
      final controller = Get.put(UserProfile());
    return ListTile(
      leading:  const CircularImage(image: 'assets/splash/lightpic.jpg',
        height: 50,
        width: 50,
        padding: 0,
        fit: BoxFit.cover,
      ),
      title: Obx(()=> Text('${controller.fullName}',style: Theme.of(context).textTheme.headlineMedium!.apply(color: AppColors.white))),
      subtitle: Obx(()=> Text('${controller.email}',style: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.white))),
      trailing:  IconButton(icon: const Icon(Iconsax.edit), color: AppColors.white,onPressed: onPressed,),
    );
  }
}