import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ui/MODEL_NEW/product_model.dart';
import 'package:ui/data/repositories.authentication/product_repository.dart';
import 'package:ui/utils/constants/enums.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  final controller =Get.put(ProductRepository());

  final isLoading = false.obs;
  RxList<ProductModel> allProducts = <ProductModel>[].obs;


  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  Future<void> fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      final products = await controller.getProducts();
      allProducts.assignAll(products);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      if (kDebugMode) {
        print("Error fetching products: ${e.toString()}");
      }
      throw Exception(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // return price if no variations
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      //check smallest snd largest variation price

      for (var variation in product.productVariations!) {
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }
    }
    if (smallestPrice.isEqual(largestPrice)) {
      return largestPrice.toString();
    } else {
      return '$smallestPrice - \$$largestPrice';
    }
  }


  String? calculateSalePercentage(double originalPrice,double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

    String getProductStockStatus(int stock){
      return stock > 0? 'In Stock': 'Out of Stock';

    }
  }



