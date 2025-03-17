class ProductCategoryModel {
  final String productId;
  final String categoryId;

  ProductCategoryModel({required this.productId, required this.categoryId});

  Map<String, dynamic> toJson() {
    return {'productId': productId, 'categoryId': categoryId};
  }

  factory ProductCategoryModel.fromJson(Map<String, dynamic> data) {
    return ProductCategoryModel(
      productId: data['productId'] as String ?? '',
      categoryId: data['productId'] as String?? '',
    );
  }
}
