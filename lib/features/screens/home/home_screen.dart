import 'package:flutter/material.dart';
import 'package:ui/commons/widgets/sectionHeader/section_header.dart';
import 'package:ui/commons/widgets/widget_Image/common_widget_image.dart';
import 'package:ui/features/screens/home/widgets/app_bar.dart';
import 'package:ui/features/screens/home/widgets/header.dart';
import 'package:ui/features/screens/home/widgets/search_bar.dart';
import 'package:ui/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(children: [
            HomeHeaderContainer(
              child: Column(
                children: [
                  const HomeAppBar(),
                  const SizedBox(height: AppSize.spaceBtwSections / 2),
                  const SearchContainer(text: 'Search products'),
                  const SizedBox(height: AppSize.spaceBtwSections / 2),
                  const SectionHeading(
                    title: 'Popular Categories',
                    showActionButton: false,
                    textColor: Colors.white,
                  ),
                  const SizedBox(height: AppSize.spaceBtwTtems),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (_, int index) {
                        return  VerticalImageText(image: 'assets/images/dark.jpg', title: 'Genius',onTap: (){},);
                      },
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}


