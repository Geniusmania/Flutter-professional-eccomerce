import 'package:flutter/material.dart';
import 'package:ui/utils/constants/sizes.dart';

class SectionHeading extends StatelessWidget {
  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;
  const SectionHeading({
    super.key,
    this.textColor,
     this.showActionButton = true,
    required this.title,
     this.buttonTitle = 'View all',
     this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSize.deafaultspace),
      child: Column(
        children: [
          Row(
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
          )
        ],
      ),
    );
  }
}
