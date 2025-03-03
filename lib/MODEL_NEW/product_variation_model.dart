class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  /// Constructor
  ProductVariationModel({
    required this.id,
     this.sku ='',
     this.image ='',
    this.description,
     this.price = 0.0,
     this.salePrice=0.0,
     this.stock=0,
    required this.attributeValues,
  });

  /// Factory method to create a ProductVariationModel from JSON
  factory ProductVariationModel.fromJson(Map<String, dynamic> json) {
    return ProductVariationModel(
      id: json['_id'],
      sku: json['sku'],
      image: json['image'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      salePrice: (json['salePrice'] as num).toDouble(),
      stock: json['stock'],
      attributeValues: Map<String, String>.from(json['attributeValues'] ?? {}),
    );
  }

  /// Converts ProductVariationModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'sku': sku,
      'image': image,
      'description': description,
      'price': price,
      'salePrice': salePrice,
      'stock': stock,
      'attributeValues': attributeValues,
    };
  }

  static ProductVariationModel empty() => ProductVariationModel(id: '', attributeValues: {});
}
