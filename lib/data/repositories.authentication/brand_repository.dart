import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../MODEL_NEW/brand_model.dart';
import '../../constant_api.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  Future<List<BrandModel>> getAllBrands() async {
    try {
      final response = await http.get(Uri.parse('${Api.URL}/api/brands'));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        return data.map((json) => BrandModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load brands: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      final response = await http
          .get(Uri.parse('${Api.URL}/api/brands?categoryId=$categoryId'));


      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => BrandModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to load brands for category $categoryId: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw Exception('Error fetching brands for category: ${e.toString()}');
    }
  }

}
