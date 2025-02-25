// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

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
    name: json["name"],
    imageUrl: json["imageUrl"],
    parentId: json["parentId"],
    isFeatured: json["isFeatured"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "imageUrl": imageUrl,
    "parentId": parentId,
    "isFeatured": isFeatured,
    "_id": id,
  };
}
