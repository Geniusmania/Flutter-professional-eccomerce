
import 'package:get/get.dart';
import 'package:ui/data/repositories.authentication/authentication_repository.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();
 final mania = Get.put(AuthenticationRepository());

  @override
  void onInit() {
   // sendEmailVerification();
    //setTimerForAutoRedirect();
    super.onInit();
  }


  

}
