import 'package:flutter/material.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/features/screens/home/widgets/shopping_counter.dart';
import 'package:ui/utils/constants/colors.dart';
import 'package:ui/utils/constants/texts.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Appbar(
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
      ShoppingCounter(iconColor: Colors.white, onPressed: () {  },),
      ],
    );
  }
}