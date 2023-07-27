import 'dart:convert';

class UserModel {
  bool? succeeded;
  String? message;
  dynamic errors;
  User? user;

  UserModel({
    this.succeeded,
    this.message,
    this.errors,
    this.user,
  });

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str), json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json, Object object) =>
      UserModel(
        succeeded: json["succeeded"],
        message: json["message"],
        errors: json["errors"],
        user: json["data"] == null ? null : User.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "succeeded": succeeded,
        "message": message,
        "errors": errors,
        "data": user?.toJson(),
      };
}

class User {
  String? id;
  String? userName;
  String? email;
  bool? emailConfirmed;
  String? firstName;
  String? lastName;
  DateTime? dateOfBirth;
  String? phoneNumber;
  bool? phoneNumberConfirmed;
  List<String>? roles;
  bool? isVerified;
  String? jwToken;

  User({
    this.id,
    this.userName,
    this.email,
    this.emailConfirmed,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.phoneNumber,
    this.phoneNumberConfirmed,
    this.roles,
    this.isVerified,
    this.jwToken,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        userName: json["userName"],
        email: json["email"],
        emailConfirmed: json["emailConfirmed"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        dateOfBirth: json["dateOfBirth"] == null
            ? null
            : DateTime.parse(json["dateOfBirth"]),
        phoneNumber: json["phoneNumber"],
        phoneNumberConfirmed: json["phoneNumberConfirmed"],
        roles: json["roles"] == null
            ? []
            : List<String>.from(json["roles"]!.map((x) => x)),
        isVerified: json["isVerified"],
        jwToken: json["jwToken"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "email": email,
        "emailConfirmed": emailConfirmed,
        "firstName": firstName,
        "lastName": lastName,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
        "phoneNumber": phoneNumber,
        "phoneNumberConfirmed": phoneNumberConfirmed,
        "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x)),
        "isVerified": isVerified,
        "jwToken": jwToken,
      };
}
