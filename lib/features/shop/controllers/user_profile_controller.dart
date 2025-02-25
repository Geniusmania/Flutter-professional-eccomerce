import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../authentication/login_and_signup/login/login.dart';

class UserProfile extends GetxController {
  static UserProfile get instance => Get.find();
@override
void onInit() {
  super.onInit();
  final token = deviceStorage.read('token');
  print('Retrieved token from storage: $token');
  if (token != null) {
    getUserProfile(token);
  } else {
    print('Token not found in storage.');
  }
}



  final deviceStorage = GetStorage();
  var userName = ''.obs; 
  var first_name = ''.obs;
  var last_name = ''.obs;
  var userImage = ''.obs; // Observable for UI updates
  var fullName = ''.obs; // Observable for UI updates
  var email = ''.obs; // Observable for UI updates
  var userPhone = ''.obs; // Observable for UI updates
  var userId = ''.obs; // Observable for UI updates

  Future<void> getUserProfile(String token) async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.30.95:3000/api/users/profile'),
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
        userImage.value = data['image']??'No Profile'; 
        fullName.value = '${data['first_name']} ${data['last_name']}' ?? 'No Name';
        email.value = data['email'] ?? 'No Email';
        userPhone.value = data['phone'] ?? 'No Phone';
      } else {
        print('Error fetching profile: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> updateUserName(String firstName, String lastName) async {
  final token = deviceStorage.read('token');
  if (token == null) {
    print('Token not found.');
    return;
  }

  try {
    final response = await http.put(
      Uri.parse('http://192.168.30.95:3000/api/users/profile'),
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
      print(' Name updated successfully: ${fullName.value}');
    } else {
      print(' Failed to update name: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    print(' Error updating name: $e');
  }
}

Future<void>deleteUser(String userId)async{

    final token = deviceStorage.read('token');
    if (token == null){
      print('Token not Found');
      return;
    }
    try{
      final response = await http.delete(Uri.parse('http://192.168.30.95:3000/api/users/$userId'),
          headers: {'Content-Type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'}
      );

      if (response.statusCode == 200){
        print('user deleted${response.statusCode}');
      }      else{
        print('Response: ${response.body}');
      }
Get.offAll(()=> const LoginScreen());
    }catch(e){
      throw Exception(e.toString());
    }
}

}
