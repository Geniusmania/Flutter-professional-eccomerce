import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ui/MODEL_NEW/user_model.dart';
import 'package:ui/features/authentication/login_and_signup/login/login.dart';
import 'package:ui/features/authentication/onboarding/onboarding.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
     deviceStorage.writeIfNull('isFirstTime', true);
       deviceStorage.read('isFirstTime') != true
           ? Get.offAll(() => const LoginScreen())
           : Get.offAll(() => const Onboarding());
   //  screenRedirect();
   // super.onReady();
  }

  // screenRedirect( ) async {
  //   //check if user is authenticated
  //   final user = _auth.currentUser;
  //   if (user != null) {
  //     if (user.emailVerified) {
  //       Get.offAll(() => const ButtonNavBar());
  //     } else {
  //       Get.offAll(() => EmailVerification(
  //             email: _auth.currentUser!.email,
  //           ));

  //       //local storage
  //     }
  //   } else {
  //     deviceStorage.writeIfNull('isFirstTime', true);
  //     deviceStorage.read('isFirstTime') != true
  //         ? Get.offAll(() => const LoginScreen())
  //         : Get.offAll(() => const Onboarding());
  //   }
  // }

  //check if user is verified




//register user
Future<UserModel?> registerUser(String phone,String email, String password,String first_name, String last_name, String username) async {
  final response = await http.post(
    Uri.parse('http://192.168.30.95:3000/api/auth/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'phone': phone,
      'email': email,
      'password': password,
      'first_name': first_name,
      'last_name': last_name,
      'username': username,
      
    }),
  );
final responseData = jsonDecode(response.body);
  if (response.statusCode == 200 || response.statusCode == 201) {
   // print("Registration Success: ${responseData['message']}");
    return null; // Returning null because no user data is sent back
  } else {
    throw Exception(responseData['message'] ?? 'Registration failed');
  }

}
  //login user

Future<UserModel?> login(String email, String password)async{
final response = await http.post(Uri.parse('http://192.168.30.95:3000/api/auth/login'),headers:{'Content-Type':'Application/json; charset=UTF-8'},body: jsonEncode({
  'email':email,
  'password':password
}));
final responseData = jsonDecode(response.body);
if(response.statusCode ==200 || response.statusCode ==201){
 // print('login successful: ${responseData['message']}');
 // print(responseData);
   final token = responseData['token']; // Correct key based on Postman response
  deviceStorage.write('token', token);
 // print('Token saved: $token');
  return null;
}else{
throw Exception(responseData['message']?? 'login failed');
}

}

  //reset password
 

//send email verification link
  

  //logout
}
