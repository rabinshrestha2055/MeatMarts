import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.id,
        this.username,
        this.email,
        this.password,
        this.confirmPassword,
        this.date,
    });

    String id;
    String username;
    String email;
    String password;
    String confirmPassword;
    DateTime date;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "password": password,
        "confirmPassword":confirmPassword,
    };
}
