import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
    String id;
    String name;
    String email;
    String password;
    bool isAdmin;
    int v;
    DateTime createdAt;
    DateTime updatedAt;

    Post({
        required this.id,
        required this.name,
        required this.email,
        required this.password,
        required this.isAdmin,
        required this.v,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        isAdmin: json["isAdmin"],
        v: json["__v"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "isAdmin": isAdmin,
        "__v": v,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
