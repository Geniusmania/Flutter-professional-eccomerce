class OrderModel {
  final String id;
  final String address;
  final String deliveryDate;
  final List<dynamic> items;
  final String orderDate;
  final String paymentMethod;
  final String status;
  final int totalAmount;
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

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'address': address,
      'deliveryDate': deliveryDate,
      'items': items,
      'orderDate': orderDate,
      'paymentMethod': paymentMethod,
      'status': status,
      'totalAmount': totalAmount,
      'userId': userId,
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['_id'] ?? '',
      address: json['address'] ?? '',
      deliveryDate: json['deliveryDate'] ?? '',
      items: json['items'] ?? [],
      orderDate: json['orderDate'] ?? '',
      paymentMethod: json['paymentMethod'] ?? '',
      userId: json['userId'] ?? '',
      status: json['status'] ?? '',
      totalAmount: json['totalAmount'] ?? 0,
    );
  }
}