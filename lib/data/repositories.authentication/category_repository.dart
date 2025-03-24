import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ui/MODEL_NEW/category_model.dart';

import '../../constant_api.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  Future<List<CategoryModel>> getAllCategory() async {
    try {
      final response = await http.get(Uri.parse('${Api.URL}/api/category'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => CategoryModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load categories: ${response.statusCode}');
      }
    } catch (e) {
      print('Fetch error: $e');
      throw Exception('Error fetching categories: $e');
    }
  }

  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    print("Fetching subcategories for category ID: $categoryId");

    try {
      final response = await http.get(Uri.parse("${Api.URL}/api/category/allsubcategories"));
      print("API Response for Subcategories: ${response.body}");
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        // ✅ Correct Filtering: Only subcategories that match the categoryId
        final filteredSubCategories = data
            .where((item) => item['category']['_id'] == categoryId)
            .map((item) => CategoryModel.fromJson(item))
            .toList();

        print("Filtered Subcategories Count: ${filteredSubCategories.length}");
        return filteredSubCategories;
      } else {
        throw Exception("Failed to load subcategories");
      }
    } catch (e) {
      print("Error fetching subcategories: $e");
      return [];
    }
  }



}
