

import 'package:get/get.dart';
import 'package:ui/features/shop/controllers/cart_controller.dart';
import 'package:ui/features/shop/controllers/checkout_controller.dart';
import 'package:ui/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
 Get.put(NetworkManager());
 Get.put(CheckoutController());
 }

}