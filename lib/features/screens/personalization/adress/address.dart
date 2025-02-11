import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/features/screens/personalization/adress/add_new_address.dart';
import 'package:ui/features/screens/personalization/adress/widgets/single_address.dart';
import 'package:ui/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(child: const Icon(Iconsax.add,color: AppColors.white,),onPressed: ()=> Get.to(()=> const AddNewAddress())),
      appBar:  Appbar(
        showBackArrow: true,
        title: Text('Addresses',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body:  const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(AppSize.deafaultspace),child:
          Column(
            children: [
            SingleAddress(selectedAddress: false),
            SingleAddress(selectedAddress: true),
            ],
          ),),
      ),
    );
  }
}
