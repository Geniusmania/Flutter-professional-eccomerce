import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  final String currency, price;
  final int maxLines;
  final bool isLarge, lineThrough;
  const ProductPrice({
    super.key,
    this.currency = 'GH₵',
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      currency + price,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(fontSizeFactor: 0.8,
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
