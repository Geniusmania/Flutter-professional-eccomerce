import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/MODEL_NEW/product_model.dart';

class ProductDetailController extends GetxController {
  static ProductDetailController get instance => Get.find();

  final selectedProductImage = ''.obs;

  List<String> fetchAllProductDetails(ProductModel product) {
    Set<String> images = {};

    images.add(product.thumbnail);

    selectedProductImage.value = product.thumbnail;
    if (product.images != null || product.images!.isNotEmpty) {
      images.addAll(product.images!);
    }
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  Future? previewProductImage(String image) {
    return Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              backgroundColor: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 400, child: CachedNetworkImage(imageUrl: image)),
                  const SizedBox(height: 50),
                  TextButton(
                      onPressed: () => Get.back(), child: const Text('Close'))
                ],
              ),
            ));
  }
}
