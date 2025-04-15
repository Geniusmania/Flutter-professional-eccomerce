import 'package:ui/MODEL_NEW/address_model.dart';
import 'package:ui/MODEL_NEW/cart_item_model.dart';
import 'package:ui/utils/helpers/helper_functions.dart';
import '../utils/constants/enums.dart';

class OrderModel {
  final String id;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;
  final DateTime orderDate;
  final String paymentMethod;
  final String status;
  final double totalAmount;
  final String userId;

  OrderModel({
    required this.id,
    required this.address,
    required this.deliveryDate,
    required this.items,
    required this.orderDate,
    required this.paymentMethod,
    required this.userId,
    required this.status,
    required this.totalAmount,
  });

  String get formattedOrderDate => HelperFunctions.getFormattedDate(orderDate);

  String get formattedDeliveryDate => deliveryDate != null
      ? HelperFunctions.getFormattedDate(deliveryDate!)
      : '';

  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipment on the way'
          : 'Processing';

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'address': address?.toJson(),
      'deliveryDate': deliveryDate,
      'items': items.map((item) => item.toJson()).toList(),
      'orderDate': orderDate,
      'paymentMethod': paymentMethod,
      'status': status.toString(),
      'totalAmount': totalAmount,
      'userId': userId,
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['_id'] ?? '',
      address: json['address'] ?? '',
      deliveryDate: json['deliveryDate'] ?? '',
      items: (json['items'] as List<dynamic>)
          .map((itemsData) =>
              CartItemModel.fromJson(itemsData as Map<String, dynamic>))
          .toList(),
      orderDate: json['orderDate'] ?? '',
      paymentMethod: json['paymentMethod'] ?? '',
      userId: json['userId'] ?? '',
      status: json['status'] ?? '',
      totalAmount: json['totalAmount'] ?? 0,
    );
  }
}
