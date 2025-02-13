import 'package:flutter/material.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/constants/texts.dart';

class SuccessScreen extends StatelessWidget {
  final String image, title, subtitle;

final  void Function()?  onPressed;
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.all(AppSize.deafaultspace),
          child: Column(
            children: [
               Column(
                children: [
                  Image(image: AssetImage(image))
                ],
              ),

              //message
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSize.deafaultspace),

              Text(subtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: AppSize.deafaultspace),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:onPressed,
                  child: const Text(
                    AppTexts.continueButton,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
