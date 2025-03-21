class CategoryModel {
  String name;
  String imageUrl;
  String parentId;
  bool isFeatured;
  String id;

  CategoryModel({
    required this.name,
    required this.imageUrl,
    this.parentId = '',
    required this.isFeatured,
    required this.id,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    name: json["name"] ?? "Unknown",  // ✅ Prevents null error
    imageUrl: json["imageUrl"] ?? "",  // ✅ Handles missing images
    parentId: json["parentId"] ?? "",  // ✅ Ensures parentId is always a string
    isFeatured: json["isFeatured"] ?? false,  // ✅ Defaults to false if missing
    id: json["_id"] ?? "",  // ✅ Ensures id is always present
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "imageUrl": imageUrl,
    "parentId": parentId,
    "isFeatured": isFeatured,
    "_id": id,
  };
}
