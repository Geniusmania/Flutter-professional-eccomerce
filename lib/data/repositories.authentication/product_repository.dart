import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ui/MODEL_NEW/product_model.dart';
import '../../constant_api.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await http.get(Uri.parse("${Api.URL}/api/products"));

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);

        // If the response is a List, return it directly
        if (decodedResponse is List) {
          return decodedResponse
              .map((item) => ProductModel.fromJson(item))
              .toList();
        }

        // If the response is a Map, check if it contains a "data" key
        else if (decodedResponse is Map<String, dynamic> &&
            decodedResponse.containsKey('data')) {
          final List<dynamic> data = decodedResponse['data'];
          return data.map((item) => ProductModel.fromJson(item)).toList();
        } else {
          throw Exception("Unexpected response format");
        }
      } else {
        Get.log('Error: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to get products');
      }
    } catch (e) {
      Get.log('Exception: $e');
      throw Exception('Error fetching products');
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(String queryParam) async {
    try {
      final response =
          await http.get(Uri.parse('${Api.URL}/api/products$queryParam'));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => ProductModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ProductModel>> getProductsForBrand(String brandId) async {
    try {
      print("Fetching products for brand ID: $brandId");

      // First try to get all products (since server filtering seems not to work)
      final response = await http.get(Uri.parse('${Api.URL}/api/products'));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        // Convert to ProductModel list
        final List<ProductModel> allProducts = data.map((item) => ProductModel.fromJson(item)).toList();

        // Apply client-side filtering
        final List<ProductModel> brandProducts = allProducts.where((product) {
          // Check if brand is not null and its id matches the requested brandId
          return product.brand != null && product.brand!.id == brandId;
        }).toList();

        print("Filtered Products for Brand ID $brandId: ${brandProducts.length}");
        return brandProducts;
      } else {
        throw Exception('Failed to fetch products for brand $brandId');
      }
    } catch (e) {
      Get.log('Error fetching brand products: $e');
      return [];
    }
  }

}
