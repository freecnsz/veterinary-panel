// To parse this JSON data, do
//
//     final growthModel = growthModelFromJson(jsonString);

import 'dart:convert';

class GrowthModel {
  List<Datum>? data;

  GrowthModel({
    this.data,
  });

  factory GrowthModel.fromRawJson(String str) =>
      GrowthModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GrowthModel.fromJson(Map<String, dynamic> json) => GrowthModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  int? petId;
  int? value;
  int? growthType;
  DateTime? date;
  String? nameOfMonth;

  Datum({
    this.id,
    this.petId,
    this.value,
    this.growthType,
    this.date,
    this.nameOfMonth,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        petId: json["petId"],
        value: json["value"],
        growthType: json["growthType"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        nameOfMonth: json["nameOfMonth"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "petId": petId,
        "value": value,
        "growthType": growthType,
        "date": date?.toIso8601String(),
        "nameOfMonth": nameOfMonth,
      };
}
