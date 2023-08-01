
// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

class User {
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

  User({
    this.pageNumber = 0,
    this.pageSize = 0,
    this.recordsFiltered = 0,
    this.recordsTotal = 0,
    this.hasNextPage = false,
    this.hasPreviousPage = false,
    this.isFirstPage = false,
    this.isLastPage = false,
    this.pageCount = 0,
    this.lastItemOnPage = 0,
    this.firstItemOnPage = 0,
    this.succeeded = false,
    this.message = "",
    this.errors = "",
    this.data = const [],
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());
  factory User.fromJson(Map<String, dynamic> json) => User(
        pageNumber: json["pageNumber"] ?? 0,
        pageSize: json["pageSize"] ?? 0,
        recordsFiltered: json["recordsFiltered"] ?? 0,
        recordsTotal: json["recordsTotal"] ?? 0,
        hasNextPage: json["hasNextPage"] ?? false,
        hasPreviousPage: json["hasPreviousPage"] ?? false,
        isFirstPage: json["isFirstPage"] ?? false,
        isLastPage: json["isLastPage"] ?? false,
        pageCount: json["pageCount"] ?? 0,
        lastItemOnPage: json["lastItemOnPage"] ?? 0,
        firstItemOnPage: json["firstItemOnPage"] ?? 0,
        succeeded: json["succeeded"] ?? false,
        message: json["message"] ?? "",
        errors: json["errors"] ?? "",
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
  String? financialAccountUserId;
  String? financialAccountName;
  String? financialAccountDescription;
  bool? isUserInBlackList;
  String? financialAccountUserName;
  String? financialAccountUserLastName;
  String? financialAccountUserTc;
  DateTime? financialAccountDateOfBirth;
  String? financialAccountPhoneNumber;
  String? financialAccountEmail;
  bool? isAccountApproved;
  DateTime? created;

  Datum({
    this.id = 0,
    this.financialAccountUserId = "",
    this.financialAccountName = "",
    this.financialAccountDescription = "",
    this.isUserInBlackList = false,
    this.financialAccountUserName = "",
    this.financialAccountUserLastName = "",
    this.financialAccountUserTc = "",
    this.financialAccountDateOfBirth,
    this.financialAccountPhoneNumber = "",
    this.financialAccountEmail = "",
    this.isAccountApproved = false,
    this.created,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());
  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? 0,
        financialAccountUserId: json["financialAccountUserId"] ?? "",
        financialAccountName: json["financialAccountName"] ?? "",
        financialAccountDescription: json["financialAccountDescription"] ?? "",
        isUserInBlackList: json["isUserInBlackList"] ?? false,
        financialAccountUserName: json["financialAccountUserName"] ?? "",
        financialAccountUserLastName:
            json["financialAccountUserLastName"] ?? "",
        financialAccountUserTc: json["financialAccountUserTC"] ?? "",
        financialAccountDateOfBirth: json["financialAccountDateOfBirth"] == null
            ? null
            : DateTime.parse(json["financialAccountDateOfBirth"]),
        financialAccountPhoneNumber: json["financialAccountPhoneNumber"] ?? "",
        financialAccountEmail: json["financialAccountEmail"] ?? "",
        isAccountApproved: json["isAccountApproved"] ?? false,
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "financialAccountUserId": financialAccountUserId,
        "financialAccountName": financialAccountName,
        "financialAccountDescription": financialAccountDescription,
        "isUserInBlackList": isUserInBlackList,
        "financialAccountUserName": financialAccountUserName,
        "financialAccountUserLastName": financialAccountUserLastName,
        "financialAccountUserTC": financialAccountUserTc,
        "financialAccountDateOfBirth":
            financialAccountDateOfBirth?.toIso8601String(),
        "financialAccountPhoneNumber": financialAccountPhoneNumber,
        "financialAccountEmail": financialAccountEmail,
        "isAccountApproved": isAccountApproved,
        "created": created?.toIso8601String(),
      };
}
