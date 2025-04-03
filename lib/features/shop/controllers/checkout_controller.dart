
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/MODEL_NEW/payment_method_model.dart';
import 'package:ui/commons/widgets/payment_tile/payment_tile.dart';
import 'package:ui/commons/widgets/sectionHeader/section_header.dart';

import 'package:ui/utils/constants/sizes.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(name: 'Paypal', image: "assets/images/pay.png");
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
                child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const SectionHeading(
                      title: 'Select payment method', showActionButton: false),
                  const SizedBox(height: AppSize.spaceBtwSections),
                  PaymentTile(
                      paymentMethod: PaymentMethodModel(
                          name: 'Paypal', image: "assets/images/pay.png")),
                  const SizedBox(height: AppSize.spaceBtwTtems / 2),
                  PaymentTile(
                      paymentMethod: PaymentMethodModel(
                          name: 'MTN MOMO', image: "assets/images/pay.png")),
                  const SizedBox(height: AppSize.spaceBtwTtems / 2),
                  PaymentTile(
                      paymentMethod: PaymentMethodModel(
                          name: 'Telecel Cash', image: "assets/images/pay.png")),
                  const SizedBox(height: AppSize.spaceBtwTtems / 2), PaymentTile(
                      paymentMethod: PaymentMethodModel(
                          name: 'Tigo Cash', image: "assets/images/pay.png")),
                  const SizedBox(height: AppSize.spaceBtwTtems / 2), PaymentTile(
                      paymentMethod: PaymentMethodModel(
                          name: 'Visa', image: "assets/images/pay.png")),

                ],
              ),
            )));
  }
}
