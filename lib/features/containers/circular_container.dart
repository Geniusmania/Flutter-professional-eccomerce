import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class CircularImage extends StatelessWidget {
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding, borderRadius;

  const CircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.overlayColor,
    this.backgroundColor,
    this.width = 50,
    this.height = 50,
    this.padding = AppSize.xs,
    this.isNetworkImage = true,
    this.borderRadius = 100,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? Colors.black : Colors.white),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: isNetworkImage
            ? CachedNetworkImage(
          imageUrl: image,
          fit: fit,
          placeholder: (context, url) =>
          const CircularProgressIndicator(), // Placeholder while loading
          errorWidget: (context, url, error) =>
          const Icon(Icons.error, color: Colors.red), // Error icon
        )
            : Image.asset(image, fit: fit),
      ),
    );
  }
}
