import 'dart:convert';

class PetsModel {
  int? pageNumber;
  int? pageSize;
  int? recordsFiltered;
  int? recordsTotal;
  bool? hasNextPage;
  bool? hasPreviousPage;
  bool? isFirstPage;
  bool? isLastPage;
  int? pageCount;
  int? lastItemOnPage;
  int? firstItemOnPage;
  bool? succeeded;
  dynamic message;
  dynamic errors;
  List<Datum>? data;

  PetsModel({
    this.pageNumber,
    this.pageSize,
    this.recordsFiltered,
    this.recordsTotal,
    this.hasNextPage,
    this.hasPreviousPage,
    this.isFirstPage,
    this.isLastPage,
    this.pageCount,
    this.lastItemOnPage,
    this.firstItemOnPage,
    this.succeeded,
    this.message,
    this.errors,
    this.data,
  });

  factory PetsModel.fromRawJson(String str) =>
      PetsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PetsModel.fromJson(Map<String, dynamic> json) => PetsModel(
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        recordsFiltered: json["recordsFiltered"],
        recordsTotal: json["recordsTotal"],
        hasNextPage: json["hasNextPage"],
        hasPreviousPage: json["hasPreviousPage"],
        isFirstPage: json["isFirstPage"],
        isLastPage: json["isLastPage"],
        pageCount: json["pageCount"],
        lastItemOnPage: json["lastItemOnPage"],
        firstItemOnPage: json["firstItemOnPage"],
        succeeded: json["succeeded"],
        message: json["message"],
        errors: json["errors"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "recordsFiltered": recordsFiltered,
        "recordsTotal": recordsTotal,
        "hasNextPage": hasNextPage,
        "hasPreviousPage": hasPreviousPage,
        "isFirstPage": isFirstPage,
        "isLastPage": isLastPage,
        "pageCount": pageCount,
        "lastItemOnPage": lastItemOnPage,
        "firstItemOnPage": firstItemOnPage,
        "succeeded": succeeded,
        "message": message,
        "errors": errors,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? name;
  String? petimage;
  String? breedName;
  String? petTypeName;
  String? genderName;
  DateTime? dob;
  bool? neutered;
  bool? status;
  String? petImage;

  Datum({
    this.id,
    this.name,
    this.petimage,
    this.breedName,
    this.petTypeName,
    this.genderName,
    this.dob,
    this.neutered,
    this.status,
    this.petImage,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        petimage: json["petimage"],
        breedName: json["breedName"],
        petTypeName: json["petTypeName"],
        genderName: json["genderName"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        neutered: json["neutered"],
        status: json["status"],
        petImage: json["petImage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "petimage": petimage,
        "breedName": breedName,
        "petTypeName": petTypeName,
        "genderName": genderName,
        "dob": dob?.toIso8601String(),
        "neutered": neutered,
        "status": status,
        "petImage": petImage,
      };
}
