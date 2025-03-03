import 'package:flutter/material.dart';
import 'package:ui/utils/constants/sizes.dart';

class RoundedImage extends StatelessWidget {
  final double? width, height;
  final String imageUrl;
  final BoxFit? fit;
  final BoxBorder? border;
  final bool applyImageRadius;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onTap;
  final double borderRadius;

  const RoundedImage({
    super.key,
    this.width =double.infinity,
    this.height=100,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.border,
    this.applyImageRadius = true,
    this.backgroundColor ,
    this.padding,
    this.isNetworkImage = false,
    this.onTap,
     this.borderRadius = AppSize.md,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: backgroundColor,
            border: border),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
              fit: fit,
              image: isNetworkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider),
        ),
      ),
    );
  }
}
