// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:ui/features/shop/controllers/favourite_controller.dart';
//
// import '../icon/circular_icon.dart';
//
// class FavouriteIcon extends StatelessWidget {
//   const FavouriteIcon({
//     super.key, required this.productId,
//   });
// final String productId;
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(FavouriteController());
//     return Obx(()=> CircularIcon(
//       onPressed: ()=> controller.toggleFavouriteProduct(productId),
//         icon:controller.isFavourite(productId) ? Iconsax.heart5: Iconsax.heart,
//         color:controller.isFavourite(productId)?  Colors.red :null,
//       ),
//     );
//   }
// }
