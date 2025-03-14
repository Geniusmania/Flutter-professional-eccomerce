import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ui/features/shop/controllers/user_profile_controller.dart';

import '../../../utils/popups/loaders.dart';
import '../../screens/personalization/profile/profile_screen.dart';

class UserUpdate{
static UserUpdate get instance => Get.find();

final first_name = TextEditingController();
final last_name = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey();


Future<void> update() async {

 try{
   await UserProfileController.instance.updateUserName(first_name.text.trim(), last_name.text.trim());

   Loaders.successSnackBar(
       title: 'Update successful',
       message: 'Your name info has been updated successfully');

Get.offAll(()=> const ProfileScreen());
 }catch(e){
   if (kDebugMode) {
     print(e.toString());
   }
   throw  Exception(e.toString());
 }
}






}