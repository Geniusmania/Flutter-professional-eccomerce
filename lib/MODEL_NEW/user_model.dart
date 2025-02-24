// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String id;
    String first_name;
    String last_name;
    String phone;
    String email;
    String password;
    bool? isAdmin;
    int v;
    DateTime createdAt;
    DateTime updatedAt;

    UserModel({
        required this.id,
        required this.first_name,
        required this.last_name,
        required this.phone,
        required this.email,
        required this.password,
         this.isAdmin,
        required this.v,
        required this.createdAt,
        required this.updatedAt,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        isAdmin: json["isAdmin"],
        v: json["__v"],
        createdAt: DateTime.parse(json["createdAt"])?? DateTime.now(),
        updatedAt: DateTime.parse(json["updatedAt"])?? DateTime.now(),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "first_name": first_name,
        "last_name": last_name,
        "phone": phone,
        "email": email,
        "password": password,
        "isAdmin": isAdmin,
        "__v": v,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
