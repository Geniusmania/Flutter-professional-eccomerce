import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String message;
    User user;
    String token;

    UserModel({
        required this.message,
        required this.user,
        required this.token,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        user: User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
        "token": token,
    };
}

class User {
    String id;
    String firstName;
    String lastName;
    String? password;
    String email;
    String username;
    String phone;
    bool? isAdmin;

    User({
        required this.id,
        required this.firstName,
        required this.lastName,
        this.password,
        required this.email,
        required this.username,
        required this.phone,
         this.isAdmin,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        password: json["password"],
        email: json["email"],
        username: json["username"],
        phone: json["phone"],
        isAdmin: json["isAdmin"]?? false,
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "first_name": firstName,
        "last_name": lastName,
        "password": password,
        "email": email,
        "username": username,
        "phone": phone,
        "isAdmin": isAdmin,
    };
}