import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ui/MODEL_NEW/user_model.dart';
import 'package:ui/constant_api.dart';
import 'package:ui/features/authentication/login_and_signup/login/login.dart';
import 'package:ui/features/authentication/onboarding/onboarding.dart';
import 'package:http/http.dart' as http;
import 'package:ui/utils/local_storage/local_storage.dart';
import 'dart:convert';
import '../../features/button_navigation_bar/button_nav_bar.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  @override
  void onReady() {
    screenRedirect();
  }
//
//   /// **Screen Redirection Logic**
  void screenRedirect() async {
    final isFirstTime = deviceStorage.read('isFirstTime') ?? true;
    final token = deviceStorage.read('token');

    if (token != null && token.isNotEmpty) {
      await LocalStorage.init(token); // Initialize only if token exists
      Get.offAll(() => const ButtonNavBar());
    } else {
      if (isFirstTime) {
        deviceStorage.write('isFirstTime', false);
        Get.offAll(() => const Onboarding());
      } else {
        Get.offAll(() => const LoginScreen());
      }
    }
  }


  /// **Register User**
  Future<UserModel?> registerUser(String phone, String email, String password,
      String firstName, String lastName, String username) async {
    try {
      final response = await http.post(
        Uri.parse('${Api.URL}/api/auth/register'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'phone': phone,
          'email': email,
          'password': password,
          'first_name': firstName,
          'last_name': lastName,
          'username': username,
        }),
      ).timeout(const Duration(seconds: 10));

      final responseData = jsonDecode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserModel.fromJson(responseData['user']);
      } else {
        throw Exception(responseData['message'] ?? 'Registration failed');
      }
    } catch (e) {
      throw Exception('Error registering user: ${e.toString()}');
    }
  }

  /// **Login User**
  Future<UserModel?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('${Api.URL}/api/auth/login'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({'email': email, 'password': password}),
      ).timeout(const Duration(seconds: 10));

      final responseData = jsonDecode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final token = responseData['token']??"";
        //final user = UserModel.fromJson(responseData['user']);

        deviceStorage.write('token', token); // Store token
        deviceStorage.write('user', responseData['user']); // Store user info

        return null;
      } else {
        throw Exception(responseData['message'] ?? 'Login failed');
      }
    } catch (e) {
      throw Exception('Error logging in: ${e.toString()}');
    }
  }

  /// **Logout User**
  Future<void> logout() async {
    await deviceStorage.erase();
    Get.offAll(() => const LoginScreen());
  }
}
