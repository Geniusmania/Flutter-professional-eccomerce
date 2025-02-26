import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/commons/widgets/sectionHeader/section_header.dart';
import 'package:ui/features/containers/circular_container.dart';
import 'package:ui/features/shop/controllers/user_profile_controller.dart';
import 'package:ui/features/screens/personalization/profile/change_name.dart';
import 'package:ui/features/screens/personalization/profile/widgets/profile_menu.dart';
import '../../../../utils/helpers/helper_functions.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserProfile());
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar:  Appbar(
        title: Text('Profile', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const CircularImage(image: 'assets/images/My_loGo.PNG'),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Change Profile Picture',
                            style: Theme.of(context).textTheme.bodySmall!.apply(color: dark? Colors.white54: Colors.black54),
                          ))
                    ],
                  )),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              const SectionHeading(
                  title: 'Profile Information',
                  showActionButton: false,
                  padding: EdgeInsets.zero),
              const SizedBox(height: 16),
              Obx(()=>ProfileMenu(
                    title: 'Name', value: '${controller.fullName}', onPressed: ()=> Get.to(()=> const ChangeName())),
              ),
              Obx(()=>
               ProfileMenu(
                    title: 'Username', value: '${controller.userName}', onPressed: () {}),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              const SectionHeading(
                  title: 'Personal Information',
                  showActionButton: false,
                  padding: EdgeInsets.zero),
              const SizedBox(height: 16),
              
              Obx(()=> ProfileMenu(
                    title: 'User-ID',
                    value: '${controller.userId}',
                    icon: Iconsax.copy,
                    onPressed: () {}),
              ),
              Obx(()=> ProfileMenu(
                    title: 'E-mail', value: '${controller.email}', onPressed: () {}),
              ),
              ProfileMenu(
                  title: 'Phone Number',
                  value: '${controller.userPhone}',
                  onPressed: () {}),
              ProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              ProfileMenu(
                  title: 'Date of Birth',
                  value: '1 JUL, 2025',
                  onPressed: () {}),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              Center(
                  child: TextButton(
                      onPressed: () => controller.deleteUser(controller.userId.value),
                      child: const Text(
                        'Close Account',
                        style: TextStyle(color: Colors.red),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
