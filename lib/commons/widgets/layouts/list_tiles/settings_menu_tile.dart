import 'package:flutter/material.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';

class SettingsMenuTile extends StatelessWidget {

  const SettingsMenuTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
     this.trailing,  this.onTap,
  });

  final String title, subtitle;
  final IconData icon;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return ListTile(
      leading: Icon(icon, size: 28, color: AppColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: dark? AppColors.light: Colors.black)),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
