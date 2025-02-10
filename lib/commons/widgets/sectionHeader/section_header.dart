import 'package:flutter/material.dart';
import 'package:ui/utils/constants/sizes.dart';

class SectionHeading extends StatelessWidget {
  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;
  final EdgeInsetsGeometry padding;
  const SectionHeading({
    super.key,
    this.textColor,
     this.showActionButton = true,
    required this.title,
     this.buttonTitle = 'View all',
     this.onPressed,
     this.padding = const EdgeInsets.only(left: AppSize.deafaultspace/2) ,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: textColor),
              overflow: TextOverflow.ellipsis,
              maxLines: 1),
      if(showActionButton)TextButton(onPressed: onPressed, child: Text(buttonTitle))
        ],
      ),
    );
  }
}
