import 'package:flutter/material.dart';
import 'package:ui/commons/widgets/widget_Image/common_widget_image.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (_, int index) {
          return  VerticalImageText(image: 'assets/images/dark.jpg', title: 'Genius',onTap: (){},);
        },
      ),
    );
  }
}