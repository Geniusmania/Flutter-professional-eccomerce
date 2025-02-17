import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:ui/features/authentication/onboarding/onboarding.dart';
import 'package:ui/firebase_options.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/theme/theme.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
// widget Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
// local storage
  await GetStorage.init();
// payment methods
// native splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
// firebase
// authentication

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //.then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: GAppTheme.darkTheme,
      theme: GAppTheme.lightTheme,
      home: const Scaffold(backgroundColor: AppColors.primary,body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}
