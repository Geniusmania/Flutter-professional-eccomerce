import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu(
      {super.key,
      required this.title,
      required this.value,
      required this.onPressed,
       this.icon =Iconsax.arrow_right_34,

      });

  final String title, value;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text(title, style: Theme.of(context).textTheme.bodySmall!.apply(color: dark? Colors.white54: Colors.black54))),
        Expanded(
            flex: 5,
            child: Text(value, style: Theme.of(context).textTheme.bodyMedium)),
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: 18,
            ))
      ],
    );
  }
}
