import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ui/data/repositories.authentication/authentication_repository.dart';
import 'package:ui/features/authentication/login_and_signup/success/success_screen.dart';
import 'package:ui/features/button_navigation_bar/button_nav_bar.dart';
import 'package:ui/features/shop/controllers/checkout_controller.dart';
import 'package:ui/utils/constants/enums.dart';
import 'package:ui/utils/local_storage/local_storage.dart';
import 'package:ui/utils/popups/loaders.dart';

import '../../../MODEL_NEW/order_model.dart';
import '../../../data/repositories.authentication/order_repository.dart';
import 'address_controller.dart';
import 'cart_controller.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();
  final deviceStorage = GetStorage();

  final cartController = CartController.instance;
  final addressController =Get.put(AddressController());
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();

      return userOrders;
    } catch (e) {
      Loaders.customToast(message: e.toString());
      return [];
    }
  }

  //add method for order processing
  void processOrder(double totalAmount) async {

    const Center(child: CircularProgressIndicator());
    try {
      final userId = deviceStorage.read('token');
      print('userId: $userId');
      if (userId.isEmpty || userId == null){
        Loaders.errorSnackBar(title: "User not logged in", message: "Please log in to place an order.");
        return;
      }

      final order = OrderModel(
          id: UniqueKey().toString(),
          userId: userId,
          status: OrderStatus.pending.name,
          orderDate: DateTime.now(),
          paymentMethod: checkoutController.selectedPaymentMethod.value.name,
          totalAmount: totalAmount,
          address: addressController.selectedAddress.value,
          deliveryDate: DateTime.now(),
          items: cartController.cartItems.toList()
      );

      await orderRepository.saveOrder(order, userId);

      cartController.clearCart();

      Get.off(() =>
          SuccessScreen(image: 'assets/images/succesful.png',
              title: 'Payment Successful',
              subtitle: 'Your order will be shipped soon!',
              onPressed: () => Get.offAll(() => NavBarScreens())));
    } catch (e) {
      print('error on processing order: $e');
      Loaders.errorSnackBar(title: "Unexpected error!", message: e.toString());
    }
  }
}
