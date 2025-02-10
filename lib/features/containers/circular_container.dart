import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class CircularImage extends StatelessWidget {
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  const CircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.overlayColor,
    this.backgroundColor,
    this.width = 50,
    this.height = 50,
    this.padding = AppSize.xs,
    this.isNetworkImage = false,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: dark ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(100),image: DecorationImage(image:isNetworkImage
          ? NetworkImage(image)
          : AssetImage(image) as ImageProvider,fit: fit,)
      ),
    );
  }
}
