import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../constant_api.dart';
import '../../authentication/login_and_signup/login/login.dart';

class UserProfileController extends GetxController {
  static UserProfileController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    final token = deviceStorage.read('token');
    print(token);
    if (token != null) {
      getUserProfile(token);
    } else {
      if (kDebugMode) {
        print('Token not found in storage.');
      }
    }
  }

  final deviceStorage = GetStorage();
  var userName = ''.obs;
  var first_name = ''.obs;
  var last_name = ''.obs;
  var userImage = ''.obs;
  var fullName = ''.obs;
  var email = ''.obs;
  var userPhone = ''.obs;
  var userId = ''.obs;

  Future<void> getUserProfile(String token) async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.30.35:3000/api/users/profile'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        print(data);

        userName.value = data['username'] ?? 'No Name';
        first_name.value = data['first_name'] ?? 'No Name';
        last_name.value = data['last_name'] ?? 'No Name';
        userId.value = data['_id'] ?? 'No ID';
        userImage.value = data['image'] ?? 'No Profile';
        fullName.value =
            '${data['first_name']} ${data['last_name']}';
        email.value = data['email'] ?? 'No Email';
        userPhone.value = data['phone'] ?? 'No Phone';
      } else {
        if (kDebugMode) {
          print('Error fetching profile: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  Future<void> updateUserName(String firstName, String lastName) async {
    final token = deviceStorage.read('token');
    if (token == null) {
      if (kDebugMode) {
        print('Token not found.');
      }
      return;
    }

    try {
      final response = await http.put(
        Uri.parse('${Api.URL}/api/users/profile'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'first_name': firstName,
          'last_name': lastName,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        fullName.value = '${data['first_name']} ${data['last_name']}';
        if (kDebugMode) {
          print(' Name updated successfully: ${fullName.value}');
        }
      } else {
        if (kDebugMode) {
          print(' Failed to update name: ${response.statusCode}');
        }
        if (kDebugMode) {
          print('Response body: ${response.body}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(' Error updating name: $e');
      }
    }
  }

  Future<void> deleteUser(String userId) async {
    final token = deviceStorage.read('token');
    if (token == null) {
      if (kDebugMode) {
        print('Token not Found');
      }
      return;
    }
    try {
      final response = await http
          .delete(Uri.parse('${Api.URL}/api/users/$userId'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      });

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('user deleted${response.statusCode}');
        }
      } else {
        if (kDebugMode) {
          print('Response: ${response.body}');
        }
      }
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
