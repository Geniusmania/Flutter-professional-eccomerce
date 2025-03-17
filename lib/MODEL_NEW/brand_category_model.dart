class BrandCategoryModel {
  final String brandId;
  final String categoryId;

  BrandCategoryModel({required this.brandId, required this.categoryId});

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'brandId': brandId,
      'categoryId': categoryId,
    };
  }

  // Factory constructor to create an object from JSON
  factory BrandCategoryModel.fromJson(Map<String, dynamic> data) {
    return BrandCategoryModel(
      brandId: data['brandId'] as String ?? '',
      categoryId: data['categoryId'] as String ?? '',
    );
  }
}
