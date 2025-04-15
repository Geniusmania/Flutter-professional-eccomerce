import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../MODEL_NEW/order_model.dart';
import '../../constant_api.dart';
import '../../utils/local_storage/local_storage.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();
  final deviceStorage = GetStorage();

  // Fetch user's orders
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final token = deviceStorage.read('token');

      if (token == null || token.isEmpty) {
        throw Exception('User not authorized');
      }

      final response = await http.get(
        Uri.parse("${Api.URL}/api/orders/users/orders"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (kDebugMode) {
        print(response.body);
      }
      if (response.statusCode == 200) {
        final List<dynamic> orderData = jsonDecode(response.body);
        return orderData.map((json) => OrderModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load orders. Status: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching orders: $e");
      }
      rethrow;
    }
  }

  // Save new order
  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      final token = deviceStorage.read('token');
      if (token == null || token.isEmpty) {
        throw Exception('User not authorized');
      }

      final response = await http.post(
        Uri.parse('${Api.url}/api/orders'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          'address': order.address,
          'deliveryDate': order.deliveryDate.toString(),
          'items': order.items.map((item) => item.toJson()).toList(),
          'orderDate': order.orderDate.toString(),
          'paymentMethod': order.paymentMethod,
          'status': order.status,
          'totalAmount': order.totalAmount,
         // 'userId': userId,

        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        // Order saved successfully
        if (kDebugMode) {
          print('Order saved: ${response.body}');
        }
      } else {
        throw Exception('Failed to save order. Status: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      if (kDebugMode) {
        print("Error saving orders: $e");
      }
      rethrow;
    }
  }
}
