import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ui/MODEL_NEW/category_model.dart';

import '../../constant_api.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();

  Future<List<CategoryModel>> getAllCategory() async {
    try {
      final response = await http.get(Uri.parse('${Api.URL}/api/allcategories'));
      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');

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



}