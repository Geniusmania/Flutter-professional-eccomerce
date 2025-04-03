import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/features/screens/cart/widgets/cart_main.dart';
import 'package:ui/features/screens/checkout/checkout.dart';
import 'package:ui/features/shop/controllers/cart_item_controller.dart';
import 'package:ui/utils/popups/animation_loader.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: Appbar(
          title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: true),
      body: Obx(() {
        const emptyWidget = AnimationLoaderWidget(
            text: 'Cart is empty', animation: 'assets/animations/empty.json');

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(child: CartMainItem());
        }
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: Obx(()=> Text('Checkout GH₵${controller.totalCartPrice.value}')),
        ),
      ),
    );
  }
}
