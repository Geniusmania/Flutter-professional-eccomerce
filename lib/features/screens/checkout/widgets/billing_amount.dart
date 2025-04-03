import 'package:flutter/material.dart';
import 'package:ui/features/shop/controllers/cart_item_controller.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/helpers/pricing_calculator.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final subTotal = controller.totalCartPrice.value;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('GHC$subTotal', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: AppSize.spaceBtwTtems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('GHC${PricingCalculator.calculateShippingCost(subTotal, 'Ghana')}', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: AppSize.spaceBtwTtems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('GHC${PricingCalculator.calculateTax(subTotal,'Ghana')}', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: AppSize.spaceBtwTtems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('GHC${PricingCalculator.calculateTotalPrice(subTotal, 'Ghana')}', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
