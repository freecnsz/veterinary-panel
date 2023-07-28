import 'dart:convert';

class PetModel {
  bool? succeeded;
  dynamic message;
  dynamic errors;
  Data? data;

  PetModel({
    this.succeeded,
    this.message,
    this.errors,
    this.data,
  });

  factory PetModel.fromRawJson(String str) =>
      PetModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PetModel.fromJson(Map<String, dynamic> json) => PetModel(
        succeeded: json["succeeded"],
        message: json["message"],
        errors: json["errors"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "succeeded": succeeded,
        "message": message,
        "errors": errors,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? name;
  dynamic petImage;
  String? breedName;
  String? petTypeName;
  String? genderName;
  DateTime? dob;
  bool? neutered;
  bool? status;

  Data({
    this.id,
    this.name,
    this.petImage,
    this.breedName,
    this.petTypeName,
    this.genderName,
    this.dob,
    this.neutered,
    this.status,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        petImage: json["petImage"],
        breedName: json["breedName"],
        petTypeName: json["petTypeName"],
        genderName: json["genderName"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        neutered: json["neutered"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "petImage": petImage,
        "breedName": breedName,
        "petTypeName": petTypeName,
        "genderName": genderName,
        "dob": dob?.toIso8601String(),
        "neutered": neutered,
        "status": status,
      };
}
