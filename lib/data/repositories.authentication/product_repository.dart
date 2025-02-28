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

      print("Raw API Response: ${response.body}"); // Debugging log

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);

        // If the response is a List, return it directly
        if (decodedResponse is List) {
          return decodedResponse.map((item) => ProductModel.fromJson(item)).toList();
        }

        // If the response is a Map, check if it contains a "data" key
        else if (decodedResponse is Map<String, dynamic> && decodedResponse.containsKey('data')) {
          final List<dynamic> data = decodedResponse['data'];
          return data.map((item) => ProductModel.fromJson(item)).toList();
        }

        // If the response is not a List or expected Map format, throw an error
        else {
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
}
