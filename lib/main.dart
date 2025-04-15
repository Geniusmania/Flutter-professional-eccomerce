import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:ui/bindings/general_bindings.dart';
import 'package:ui/routes/app_routes.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/local_storage/local_storage.dart';
import 'package:ui/utils/theme/theme.dart';
import 'package:get_storage/get_storage.dart';
import 'data/repositories.authentication/authentication_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
 // await LocalStorage.init('Genius');
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);

  Get.put(AuthenticationRepository());

  runApp(const MyApp());
  FlutterNativeSplash.remove();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: GAppTheme.darkTheme,
      theme: GAppTheme.lightTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: const Scaffold(backgroundColor: AppColors.primary,
          body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}
