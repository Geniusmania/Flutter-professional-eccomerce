import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/commons/widgets/sectionHeader/section_header.dart';
import 'package:ui/features/containers/circular_container.dart';

import 'package:ui/features/screens/personalization/profile/widgets/profile_menu.dart';

import '../../../../utils/helpers/helper_functions.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const Appbar(
        title: Text('Profile'),
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
              ProfileMenu(
                  title: 'Name', value: 'Genius Mania', onPressed: () {}),
              ProfileMenu(
                  title: 'Username', value: 'Solomon', onPressed: () {}),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              const SectionHeading(
                  title: 'Personal Information',
                  showActionButton: false,
                  padding: EdgeInsets.zero),
              const SizedBox(height: 16),
              ProfileMenu(
                  title: 'User-ID',
                  value: '123456',
                  icon: Iconsax.copy,
                  onPressed: () {}),
              ProfileMenu(
                  title: 'E-mail', value: 'genius@gmail.com', onPressed: () {}),
              ProfileMenu(
                  title: 'Phone Number',
                  value: '+233596605771',
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
                      onPressed: () {},
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
