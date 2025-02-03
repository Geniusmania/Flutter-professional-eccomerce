import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/features/authentication/onboarding/onboarding.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/theme/theme.dart';

void main() {
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
      home: const Onboarding(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
                const Image(image: AssetImage('assets/images/My_loGo.PNG')),
                const SizedBox(
          height: AppSize.deafaultspace,
                ),
                Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'First Name',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: AppSize.spaceBtwTtems,
                        ),
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Last Name',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppSize.spaceBtwInputField,
                    ),
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.spaceBtwInputField,
                    ),
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.spaceBtwInputField,
                    ),
                    const Text.rich(
                        TextSpan(children: [TextSpan(text: 'Login Or SignUp')])),
                    const SizedBox(
                      height: AppSize.spaceBtwInputField,
                    ),
          
                    SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child:const Text('Create Account')),)
                  ],
                ),
              ),
            ],
          ),
                )
              ]),
        ));
  }
}
