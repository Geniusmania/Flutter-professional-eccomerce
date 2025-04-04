import 'package:get/get.dart';
import 'package:ui/features/shop/controllers/checkout_controller.dart';
import 'package:ui/utils/popups/loaders.dart';

import '../../../MODEL_NEW/order_model.dart';
import '../../../data/repositories.authentication/order_repository.dart';
import 'address_controller.dart';
import 'cart_controller.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrders() async{
    try {
      final userOrders = await orderRepository.fetchUserOrders();

      return userOrders;
    } catch (e) {
      Loaders.customToast(message: e.toString());
      return [];
    }
  }
}
