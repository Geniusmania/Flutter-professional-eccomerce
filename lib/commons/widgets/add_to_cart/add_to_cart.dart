import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/MODEL_NEW/product_model.dart';
import 'package:ui/features/shop/controllers/cart_item_controller.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/constants/sizes.dart';

import '../../../features/screens/product_details/product_details.dart';
import '../../../utils/constants/enums.dart';

class ProductAddToCart extends StatelessWidget {
  const ProductAddToCart({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    if (product.id.isEmpty) {
      return const SizedBox.shrink();
    }

    final controller = Get.put(CartController());
    return InkWell(
      onTap: () => _handleAddToCart(controller, context),
      child: Obx(() {
        final quantity = controller.getProductQuantityInCart(product.id);
        return _buildCartButton(context, quantity);
      }),
    );
  }

  void _handleAddToCart(CartController controller, BuildContext context) {
    try {
      if (product.productType == ProductType.single.name) {
        final cartItem = controller.convertToCartItem(product, 1);
        controller.addOneToCart(cartItem);
      } else {
        Get.to(() => ProductDetailScreen(product: product));
      }
    } catch (e) {
      debugPrint('Error adding to cart: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to add item to cart')),
      );
    }
  }

  Widget _buildCartButton(BuildContext context, int quantity) {
    return Container(
      decoration: BoxDecoration(
        color: quantity > 0 ? AppColors.primary : AppColors.dark,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSize.cardRadiusMd),
          bottomRight: Radius.circular(AppSize.productImageRadius),
        ),
      ),
      child: SizedBox(
        height: AppSize.iconLg * 1.2,
        width: AppSize.iconLg * 1.2,
        child: quantity > 0
            ? Center(
          child: Text(
            quantity.toString(),
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .apply(color: Colors.white),
          ),
        )
            : const Icon(
          Iconsax.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}