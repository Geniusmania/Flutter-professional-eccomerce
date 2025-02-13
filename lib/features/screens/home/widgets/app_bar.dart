import 'package:flutter/material.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/features/screens/home/widgets/shopping_counter.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/constants/sizes.dart';
import 'package:ui/utils/constants/texts.dart';
import 'package:ui/utils/helpers/helper_functions.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.md),
      child: Appbar(
        title: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppTexts.appBarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: AppColors.grey),
            ),
            Text(
              AppTexts.appBarSubTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: AppColors.grey),
            )
          ],
        ),
        actions:  [
        ShoppingCounter(onPressed: () {  }, iconColor:AppColors.white),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}