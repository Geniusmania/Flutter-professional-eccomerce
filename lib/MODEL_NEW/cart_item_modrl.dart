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
      'product_id': productId,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
      'variation_id': variationId,
      'brand_name': brandName,
      'selected_variations': selectedVariations,
    };
  }

  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['product_id'],
      title: json['title'] ?? "",
      price: json['price']?.toDouble() ?? 0.0, 
      image: json['image'],
      quantity: json['quantity'],
      variationId:
          json['variation_id'] ?? '',
      brandName: json['brand_name'],
      selectedVariations: json['selected_variations'] != null
          ? Map<String, String>.from(json['selected_variations'])
          : null, // Handle null case for selectedVariations
    );
  }
}
