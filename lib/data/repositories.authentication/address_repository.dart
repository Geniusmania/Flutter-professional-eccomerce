import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:ui/MODEL_NEW/address_model.dart';
import 'package:ui/constant_api.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();
  final deviceStorage = GetStorage();

  /// **Fetch addresses for the logged-in user**
  Future<List<AddressModel>> getAddress() async {
    try {
      final token = deviceStorage.read('token'); // Retrieve token
      if (token == null || token.isEmpty) {
        throw Exception("User is not authenticated");
      }

      final response = await http.get(
        Uri.parse("${Api.URL}/api/address"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> addressData = jsonDecode(response.body);
        return addressData.map((json) => AddressModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch address: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching addresses: $e');
    }
  }

  /// **Update selected address field**
  Future<void> updateSelectedField(String addressId, bool selected) async {
    try {
      final token = deviceStorage.read('token'); // Retrieve token
      if (token == null || token.isEmpty) {
        throw Exception("User is not authenticated");
      }

      final response = await http.put(
        Uri.parse("${Api.URL}/api/address/$addressId"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token", // Send token
        },
        body: jsonEncode({"isSelected": selected}),
      );

      if (response.statusCode != 200) {

        throw Exception("Failed to update address selection: ${response.body}");
      }
    } catch (e) {
      throw Exception("Error updating address: $e");
    }
  }

  Future<AddressModel> addAddress(
      String name,
      String city,
      String state,
      String country,
      String street,
      String postalCode,
      String phoneNumber) async {
    try {
      final token = deviceStorage.read('token');
      if (token == null || token.isEmpty) {
        throw Exception("User is not authorized");
      }

      final response = await http.post(
        Uri.parse("${Api.URL}/api/address"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode({
          "name": name,
          "city": city,
          "state": state,
          "country": country,
          "street": street,
          "postalCode": postalCode,
          "phoneNumber": phoneNumber,
          "isSelected": false,
        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return AddressModel.fromJson(jsonDecode(response.body));
      } else {
        print(response.statusCode);
        throw Exception("Failed to add address: ${response.body}");
      }
    } catch (e) {
      throw Exception("Error adding address: $e");
    }
  }
}
