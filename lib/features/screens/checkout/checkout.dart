import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/commons/widgets/roudedContainer/rounded_container.dart';
import 'package:ui/features/authentication/login_and_signup/success/success_screen.dart';
import 'package:ui/features/button_navigation_bar/button_nav_bar.dart';
import 'package:ui/features/screens/cart/widgets/cart_main.dart';
import 'package:ui/features/screens/checkout/widgets/billing_address.dart';
import 'package:ui/features/screens/checkout/widgets/billing_payment.dart';
import 'package:ui/features/screens/checkout/widgets/coupon.dart';
import 'package:ui/features/screens/checkout/widgets/billing_amount.dart';
import 'package:ui/features/shop/controllers/cart_controller.dart';
import 'package:ui/utils/helpers/helper_functions.dart';
import 'package:ui/utils/helpers/pricing_calculator.dart';
import 'package:ui/utils/popups/loaders.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../shop/controllers/order_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final orderController = Get.put(OrderController());
    final subTotal = controller.totalCartPrice.value;
    final totalAmount =
        PricingCalculator.calculateTotalPrice(subTotal, "Ghana");
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: Appbar(
        showBackArrow: true,
        title:
            Text('Checkout', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const CartMainItem(showAddRemoveButton: false),
              const SizedBox(height: AppSize.spaceBtwSections),
              const CouponCode(),
              const SizedBox(height: AppSize.spaceBtwSections),
              RoundedContainer(
                padding: const EdgeInsets.all(AppSize.md),
                showBorder: true,
                backgroundColor: dark ? AppColors.black : AppColors.white,
                child: const Column(
                  children: [
                    //pricing
                    BillingAmountSection(),
                    SizedBox(height: AppSize.spaceBtwTtems),
                    //divider
                    Divider(),
                    SizedBox(height: AppSize.spaceBtwTtems),
                    BillingPaymentSection(),
                    SizedBox(height: AppSize.spaceBtwTtems),
                    BillingAddress()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(
          onPressed: subTotal > 0
              ? () => orderController.processOrder(totalAmount)
              : Loaders.customToast(message: 'Add items to cart to proceed'),
          child: Text('Checkout GHC$totalAmount'),
        ),
      ),
    );
  }
}
