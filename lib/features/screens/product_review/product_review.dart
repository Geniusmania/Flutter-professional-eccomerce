import 'package:flutter/material.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/features/screens/product_review/widgets/overall_progress_indicator.dart';
import 'package:ui/features/screens/product_review/widgets/rating_bar_indicator.dart';
import 'package:ui/features/screens/product_review/widgets/user_review.dart';
import '../../../utils/constants/sizes.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: Text('Reviews and Ratings',style: Theme.of(context).textTheme.headlineSmall),showBackArrow: true),
      body:   const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Ratings and reviews are verified and are from people who use the same type of device that you use.'),
              SizedBox(height: AppSize.spaceBtwTtems),

              OverallProductRating(),
             RatingBarIndicatorWidget(rating: 3.5),
              Text('12,654'),//,style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: AppSize.spaceBtwSections,),

              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
          ],),
        ),
      ),
    );
  }
}



