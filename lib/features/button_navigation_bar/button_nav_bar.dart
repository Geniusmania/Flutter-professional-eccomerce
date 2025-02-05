import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/features/screens/home/home_screen.dart';
import 'package:ui/features/screens/profile/profile.dart';
import 'package:ui/features/screens/wishlist/wish_list.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

import '../screens/Store/shop.dart';

class ButtonNavBar extends StatelessWidget {
  const ButtonNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavBarScreens());
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 50,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
                indicatorColor: dark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
              NavigationDestination(
                  icon: Icon(Iconsax.heart), label: 'Wishlist'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavBarScreens extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const WishListScreen(),
    const ProfileScreen(),
  ];
}
