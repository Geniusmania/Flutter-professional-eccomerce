// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  String id;
  String imageUrl;
  final String targetScreen;
  final bool isActive;

  BannerModel({
    required this.id,
    required this.imageUrl,
    required this.targetScreen,
    required this.isActive,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    imageUrl: json["imageUrl"],
    targetScreen: json["targetScreen"],
    isActive: json["isActive"], id: json['_id'],
  );

  Map<String, dynamic> toJson() => {
    "imageUrl": imageUrl,
    "targetScreen": targetScreen,
    "isActive": isActive,
    "_id": id
  };
}
