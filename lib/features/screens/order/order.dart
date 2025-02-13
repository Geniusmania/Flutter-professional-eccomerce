import 'package:flutter/material.dart';
import 'package:ui/commons/widgets/appbar/appBar.dart';
import 'package:ui/features/screens/order/widgets/order_ist_item.dart';
import 'package:ui/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Appbar(title: Text('Orders'), showBackArrow: true),
      body: Padding(
        padding: EdgeInsets.all(AppSize.deafaultspace),
        child: OrderListItem(),
      ),
    );
  }
}
