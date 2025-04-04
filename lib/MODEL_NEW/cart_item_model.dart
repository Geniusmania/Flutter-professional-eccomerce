class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariations;

  CartItemModel({
    required this.productId,
    this.title = "",
    this.price = 0.0,
    this.image,
    required this.quantity,
    this.variationId = '',
    this.brandName,
    this.selectedVariations,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
      'variationId': variationId,
      'brandName': brandName,
      'selectedVariations': selectedVariations,
    };
  }

  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'],
      title: json['title'] ?? "",
      price: json['price']?.toDouble() ?? 0.0, 
      image: json['image'],
      quantity: json['quantity'],
      variationId:
          json['variationId'] ?? '',
      brandName: json['brandName'],
      selectedVariations: json['selectedVariations'] != null
          ? Map<String, String>.from(json['selectedVariations'])
          : null, // Handle null case for selectedVariations
    );
  }
}
