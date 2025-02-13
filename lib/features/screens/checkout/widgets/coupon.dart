
import 'package:flutter/material.dart';

import '../../../../commons/widgets/roudedContainer/rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class CouponCode extends StatelessWidget {
  const CouponCode({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return RoundedContainer(
      showBorder: true,
      backgroundColor: dark ? AppColors.dark : AppColors.white,
      padding: const EdgeInsets.only(
          top: AppSize.sm,
          bottom: AppSize.sm,
          right: AppSize.sm,
          left: AppSize.md),
      child: Row(
        children: [
          Flexible(
              child: TextFormField(
                decoration: const InputDecoration(
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    isDense: true,
                    hintText: 'Have a promo code? Enter here'),
              )),
          SizedBox(
            width: 80,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: dark
                        ? AppColors.white.withOpacity(0.5)
                        : AppColors.dark.withOpacity(0.5),  backgroundColor:
                AppColors.grey.withOpacity(0.2),
                    side: BorderSide(color: Colors.grey.withOpacity(0.1))
                ),
                onPressed: () {},
                child: const Text('Apply')),
          )
        ],
      ),
    );
  }
}
