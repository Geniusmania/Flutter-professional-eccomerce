import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/MODEL_NEW/product_model.dart';
import 'package:ui/features/screens/product_details/product_details.dart';
import 'package:ui/features/shop/controllers/cart_item_controller.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/constants/enums.dart';
import 'package:ui/utils/constants/sizes.dart';

class ProductAddToCart extends StatelessWidget {
  const ProductAddToCart({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return InkWell(
      onTap: (){
if(product.productType == ProductType.single.name){
  final cartItem = controller.convertToCartItem(product, 1);
  controller.addOneToCart(cartItem);
}else{
  Get.to(()=>  ProductDetailScreen(product: product));
}

      },
      child: Obx(
        (){ 
          
          final quantityOfItemInCart = controller.getProductQuantityInCart(product.id);
          
          return Container(
          decoration:  BoxDecoration(
              color:quantityOfItemInCart> 0? AppColors.primary: AppColors.dark,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppSize.cardRadiusMd),
                  bottomRight: Radius.circular(AppSize.productImageRadius))),
          child:  SizedBox(
              height: AppSize.iconLg * 1.2,
              width: AppSize.iconLg * 1.2,
              child: quantityOfItemInCart>0? Text(controller.productQuantityInCart.toString(),style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.white),): const Icon(
                Iconsax.add,
                color: AppColors.white,
              )),
        );
  }),
    );
  }
}
