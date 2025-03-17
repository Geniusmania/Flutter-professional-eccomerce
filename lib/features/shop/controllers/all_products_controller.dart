import 'package:get/get.dart';
import 'package:ui/MODEL_NEW/product_model.dart';
import 'package:ui/data/repositories.authentication/product_repository.dart';
import 'package:ui/utils/popups/loaders.dart';

class AllProductsController extends GetxController {
  AllProductsController get instance => Get.find();
  final repository = Get.put(ProductRepository());

  Future<List<ProductModel>> fetchProductsByQuery(String query) async {
    try {
      final products = await repository.fetchProductsByQuery(query);
      return products;
    } catch (e) {
      Loaders.errorSnackBar(title: 'Sorry', message: e.toString());
      return [];
    }
  }
}
