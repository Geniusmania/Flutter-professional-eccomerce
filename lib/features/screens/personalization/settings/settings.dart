import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/commons/widgets/layouts/list_tiles/settings_menu_tile.dart';
import 'package:ui/commons/widgets/sectionHeader/section_header.dart';
import 'package:ui/features/screens/cart/cart.dart';
import 'package:ui/features/screens/home/widgets/header.dart';
import 'package:ui/features/screens/order/order.dart';
import '../../../../commons/widgets/layouts/list_tiles/profile_tile.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../adress/address.dart';
import '../profile/profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          HomeHeaderContainer(
              child: Column(children: [
            Appbar(
                title: Text('Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: AppColors.white))),
            const SizedBox(height: AppSize.spaceBtwSections),
            UserProfileTile(onPressed: ()=> Get.to(()=> const ProfileScreen())),
            const SizedBox(height: AppSize.spaceBtwSections),
          ])),

          //.......................body..................//]
          
           Padding(padding: const EdgeInsets.all(24),
          child: Column(children: [
             const SectionHeading(title: 'Account Settings',showActionButton: false),
            const SizedBox(height: 24),
            SettingsMenuTile(title: 'My addresses', subtitle:'Set shopping delivery address', icon: Iconsax.safe_home,onTap: ()=> Get.to(()=> const UserAddressScreen())),
            SettingsMenuTile(title: 'My Cart', subtitle:'Add, remove products and move to checkout', icon: Iconsax.shopping_cart,onTap: ()=> Get.to(()=> const CartScreen())),
            SettingsMenuTile(title: 'My Orders', subtitle:'In-progress and Completed Orders', icon: Iconsax.bag_tick,onTap: ()=> Get.to(()=> const OrderScreen())),
            SettingsMenuTile(title: 'Bank Account', subtitle:'Withdraw balance', icon: Iconsax.bank,onTap: (){}),
            SettingsMenuTile(title: 'My Coupons', subtitle:'List of all discounted coupons', icon: Iconsax.discount_shape,onTap: (){}),
            SettingsMenuTile(title: 'Notifications', subtitle:'Set sny kind of notification message', icon: Iconsax.notification,onTap: (){}),
            SettingsMenuTile(title: 'Account Privacy', subtitle:'Manage data usage and connected accounts', icon: Iconsax.security_card,onTap: (){}),
            const SizedBox(height: 32),
            const SectionHeading(title: 'App Settings', showActionButton: false),
            const SizedBox(height: 24),
            SettingsMenuTile(title: 'Load Data', subtitle:'Upload Data to your cloud fireStore', icon: Iconsax.document_upload,onTap: (){}),
            SettingsMenuTile(title: 'Geolocation', subtitle:'Set recommendation based on location', icon: Iconsax.location,onTap: (){},trailing: Switch(value: true, onChanged: (value){})),
            SettingsMenuTile(title: 'Safe Mode', subtitle:'Search result is safe for all ages', icon: Iconsax.security_user,onTap: (){},trailing: Switch(value: false, onChanged: (value){})),
            SettingsMenuTile(title: 'HD Image Quality', subtitle:'Set image quality to be seen', icon: Iconsax.image,onTap: (){},trailing: Switch(value: false, onChanged: (value){})),

const SizedBox(height: AppSize.spaceBtwSections,),
            SizedBox(
              width: double.infinity,child: 
              OutlinedButton(onPressed: (){}, child: const Text('Logout')),
            ),
            const SizedBox(height: AppSize.spaceBtwSections*2.5),

          ],),)
        ],
      ),
    ));
  }
}
