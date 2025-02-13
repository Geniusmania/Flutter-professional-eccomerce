import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/features/screens/cart/widgets/cart_main.dart';
import 'package:ui/features/screens/checkout/checkout.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Appbar(
          title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: true),
      body:const CartMainItem(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(onPressed: ()=> Get.to(()=> const CheckoutScreen()), child: const Text('Checkout GH₵237'),),
      ),
    );
  }
}


