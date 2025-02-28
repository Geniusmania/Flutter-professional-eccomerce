import 'package:ui/MODEL_NEW/brand_model.dart';
import 'package:ui/MODEL_NEW/product_attribute_model.dart';
import 'package:ui/MODEL_NEW/product_variation_model.dart';


class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  List<String>? images;
  String? categoryId;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.stock,
    this.sku,
    required this.price,
    required this.title,
    this.date,
    required this.salePrice,
    required this.thumbnail,
    this.isFeatured,
    this.brand,
    this.description,
    this.images,
    this.categoryId,
    required this.productType,
    this.productAttributes,
    this.productVariations,
  });

  /// Factory constructor for creating a new `ProductModel` from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      stock: json['stock'],
      sku: json['sku'],
      price: double.parse((json['price']??0.0).toString()),
      title: json['title'],
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      salePrice: (json['salePrice'] as num).toDouble(),
      thumbnail: json['thumbnail'],
      isFeatured: json['isFeatured'] ?? false,
      brand: json['brand'] != null ? BrandModel.fromJson(json['brand']) : null,
      description: json['description'],
      images: json['images'] != null ? List<String>.from(json['images']) : [],
      categoryId: json['categoryId'],
      productType: json['productType'],
      productAttributes: json['productAttributes'] != null
          ? (json['productAttributes'] as List)
          .map((attr) => ProductAttributeModel.fromJson(attr))
          .toList()
          : [],
      productVariations: json['productVariations'] != null
          ? (json['productVariations'] as List)
          .map((varn) => ProductVariationModel.fromJson(varn))
          .toList()
          : [],
    );
  }

  /// Converts this `ProductModel` to JSON
  Map<String, dynamic> toJson() => {
    '_id': id,
    'stock': stock,
    'sku': sku,
    'price': price,
    'title': title,
    'date': date?.toIso8601String(),
    'salePrice': salePrice,
    'thumbnail': thumbnail,
    'isFeatured': isFeatured,
    'brand': brand?.toJson(),
    'description': description,
    'images': images,
    'categoryId': categoryId,
    'productType': productType,
    'productAttributes': productAttributes?.map((e) => e.toJson()).toList(),
    'productVariations': productVariations?.map((e) => e.toJson()).toList(),
  };

  static empty() {}
}
