import 'package:flutter/material.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

class VerticalImageText extends StatelessWidget {
  final String image, title;
  final Color textColor;
  final void Function()? onTap;
  final Color? backgroundColor;
  const VerticalImageText({
    super.key,
    required this.image,
    required this.title,
   this.textColor = Colors.white,
    this.onTap,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: AppSize.spaceBtwTtems/2),
        child: Column(
          children: [
            Container(
              height: 56,
              width: 56,
              padding: const EdgeInsets.all(AppSize.xs),
              decoration: BoxDecoration(
                  color:backgroundColor  ?? (HelperFunctions.isDarkMode(context)? Colors.black: Colors.white),
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(100)),
              child:  Center(
                  child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,//color: (HelperFunctions.isDarkMode(context)? AppColors.dark: AppColors.light),
              )),
            ),
            SizedBox(
              width: 55,
              child: Center(
                  child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )),
            )
          ],
        ),
      ),
    );
  }
}