// To parse this JSON data, do
//
//     final petVaccineModel = petVaccineModelFromJson(jsonString);

import 'dart:convert';

class PetVaccineModel {
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
  List<Data>? data;

  PetVaccineModel({
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

  factory PetVaccineModel.fromRawJson(String str) =>
      PetVaccineModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PetVaccineModel.fromJson(Map<String, dynamic> json) =>
      PetVaccineModel(
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
            : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
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

class Data {
  int? id;
  String? name;
  String? productName;
  DateTime? date;
  String? clinic;

  Data({
    this.id,
    this.name,
    this.productName,
    this.date,
    this.clinic,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        productName: json["productName"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        clinic: json["clinic"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "productName": productName,
        "date": date?.toIso8601String(),
        "clinic": clinic,
      };
}
