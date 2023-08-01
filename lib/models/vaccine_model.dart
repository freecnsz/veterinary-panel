import 'dart:convert';
// To parse this JSON data, do
//
//     final vaccineModel = vaccineModelFromJson(jsonString);

class VaccineModel {
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

  VaccineModel({
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

  factory VaccineModel.fromRawJson(String str) =>
      VaccineModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VaccineModel.fromJson(Map<String, dynamic> json) => VaccineModel(
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
  String? productName;

  Datum({
    this.id,
    this.name,
    this.productName,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        productName: json["productName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "productName": productName,
      };
}
