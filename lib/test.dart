import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ui/MODEL_NEW/brand_model.dart';
import 'MODEL_NEW/category_model.dart';
import 'constant_api.dart';

class Test {
  Future<List<BrandModel>> getAllCategory() async {
    try {
      final response = await http.get(Uri.parse('${Api.URL}/api/brands'));
      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => BrandModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load brands: ${response.statusCode}');
      }
    } catch (e) {
      print('Fetch error: $e');
      throw Exception('Error fetching brands: $e');
    }
  }
}

Future<void> main() async {
  final tester = Test();
  try {
    final categories = await tester.getAllCategory();
    print('Categories fetched successfully: $categories');
  } catch (e) {
    print('Main error: $e');
  }
}
