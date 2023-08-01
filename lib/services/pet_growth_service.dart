import 'dart:io';
import 'package:flutter_boilerplate/models/pet_growth_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GrowthService {
  static Map<String, String> token = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader:
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1NDUyNzA4Mzc4IiwianRpIjoiNDM5MDY3YWUtZGExMi00ZjIyLWFkNzktMTc4Mzc4ZmMyOGNhIiwiZW1haWwiOiJtZWhtZXRrbW9iaWxAZ21haWwuY29tIiwidWlkIjoiYWY3YzQ2MWQtMjhjNi00YjhhLWE2ZTAtMzhmYTllNjg5MjNkIiwiaXAiOiIxNzIuMzEuMzYuMTQ1Iiwicm9sZXMiOiJCYXNpYyIsImV4cCI6MTY5OTA5OTk2NCwiaXNzIjoiQ29yZUlkZW50aXR5IiwiYXVkIjoiQ29yZUlkZW50aXR5VXNlciJ9.5qMfWHqxGCqlg2gOLIRLPTX3hQYYX3NGtRp20ixJkCI'
  };

  Future<GrowthModel> getEn(String id) async {
    var url = Uri.parse(
        "https://comnets.arabulucuyuz.net/petapi/v1/GrowthTracking/GetAllGrowthTrackingsByPetId?PetId=$id&GrowthType=2");
    final http.Response response = await http.get(
      url,
      headers: token,
    );

    switch (response.statusCode) {
      case 200:
        final jsonResponse = json.decode(response.body);
        return GrowthModel.fromJson(jsonResponse); // Parse the JSON here
      default:
        throw Exception('Failed to load data');
    }
  }

  Future<GrowthModel> getBoy(String id) async {
    var url = Uri.parse(
        "https://comnets.arabulucuyuz.net/petapi/v1/GrowthTracking/GetAllGrowthTrackingsByPetId?PetId=$id&GrowthType=1");
    final http.Response response = await http.get(
      url,
      headers: token,
    );

    switch (response.statusCode) {
      case 200:
        final jsonResponse = json.decode(response.body);
        return GrowthModel.fromJson(jsonResponse); // Parse the JSON here
      default:
        throw Exception('Failed to load data');
    }
  }
}
