import 'package:flutter/material.dart';
import 'package:ui/utils/devices/device_utility.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class TabBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const TabBarWidget({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? Colors.black : Colors.white,
      child: TabBar(
        padding: EdgeInsets.zero,
        tabs: tabs,
        isScrollable: true,
        indicatorColor: AppColors.primary,
        labelColor: dark ? Colors.white : AppColors.primary,
        unselectedLabelColor: AppColors.darkgrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtility.getAppBarHeight());
}
