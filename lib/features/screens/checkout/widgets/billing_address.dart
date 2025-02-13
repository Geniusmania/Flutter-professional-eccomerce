import 'package:flutter/material.dart';
import 'package:ui/commons/widgets/sectionHeader/section_header.dart';

import '../../../../utils/constants/sizes.dart';

class BillingAddress extends StatelessWidget {
  const BillingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
            padding: EdgeInsets.zero,
            title: 'Shipping Address',
            buttonTitle: 'Change',
            onPressed: () {}),
        Text('Tech Genius', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: AppSize.spaceBtwTtems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: AppSize.spaceBtwTtems),
            Text('+233 596605771',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: AppSize.spaceBtwTtems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: AppSize.spaceBtwTtems),
            Text('East Legon, American House, Sai Nii Road',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: AppSize.spaceBtwTtems / 2),
      ],
    );
  }
}
