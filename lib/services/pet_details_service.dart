import 'dart:io';
import 'package:flutter_boilerplate/models/pet_model.dart';
import 'package:flutter_boilerplate/models/pet_vaccine_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PetService {
  static Map<String, String> token = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader:
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1NDUyNzA4Mzc4IiwianRpIjoiNDM5MDY3YWUtZGExMi00ZjIyLWFkNzktMTc4Mzc4ZmMyOGNhIiwiZW1haWwiOiJtZWhtZXRrbW9iaWxAZ21haWwuY29tIiwidWlkIjoiYWY3YzQ2MWQtMjhjNi00YjhhLWE2ZTAtMzhmYTllNjg5MjNkIiwiaXAiOiIxNzIuMzEuMzYuMTQ1Iiwicm9sZXMiOiJCYXNpYyIsImV4cCI6MTY5OTA5OTk2NCwiaXNzIjoiQ29yZUlkZW50aXR5IiwiYXVkIjoiQ29yZUlkZW50aXR5VXNlciJ9.5qMfWHqxGCqlg2gOLIRLPTX3hQYYX3NGtRp20ixJkCI'
  };
  Future<PetModel> getPetDetails(String id) async {
    var url = Uri.parse(
        "https://comnets.arabulucuyuz.net/petapi/v1/Pet/GetPetById?Id=$id");
    final http.Response response = await http.get(
      url,
      headers: token,
    );

    switch (response.statusCode) {
      case 200:
        return PetModel.fromRawJson(response.body);
      default:
        return PetModel.fromJson(json.decode(response.body));
    }
  }

  Future<PetVaccineModel> getListVaccines(String id) async {
    var url = Uri.parse(
        "https://comnets.arabulucuyuz.net/petapi/v1/PetVaccine/GetAllPetVaccinesByPetId?PetId=$id");
    final http.Response response = await http.get(
      url,
      headers: token,
    );

    switch (response.statusCode) {
      case 200:
        return PetVaccineModel.fromRawJson(response.body);
      default:
        return PetVaccineModel.fromJson(json.decode(response.body));
    }
  }
}
