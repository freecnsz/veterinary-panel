import 'dart:async';

import 'package:flutter_boilerplate/models/vaccine_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1NDUyNzA4Mzc4IiwianRpIjoiZTkzMGQ4YzAtOGJmNi00NTIwLWJmNzEtOWYwODMxZTI4N2YyIiwiZW1haWwiOiJtZWhtZXRrbW9iaWxAZ21haWwuY29tIiwidWlkIjoiYWY3YzQ2MWQtMjhjNi00YjhhLWE2ZTAtMzhmYTllNjg5MjNkIiwiaXAiOiIxNzIuMzEuMzYuMTQ1Iiwicm9sZXMiOiJCYXNpYyIsImV4cCI6MTY5OTA5OTk4MiwiaXNzIjoiQ29yZUlkZW50aXR5IiwiYXVkIjoiQ29yZUlkZW50aXR5VXNlciJ9.K9DGauQo-qjvwyDtK0QYz0L5Q15PFP5iVG__KkbwRPM";

class VaccineService {
  Future<VaccineModel> getVaccines() async {
    try {
      var url = Uri.parse(
        'https://comnets.arabulucuyuz.net/petapi/v1/Vaccine/GetAllVaccine',
      );
      final http.Response response =
          await http.get(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer $token",
      }).timeout(const Duration(seconds: 60));

      switch (response.statusCode) {
        case 200:
          return VaccineModel.fromRawJson(response.body);
        default:
          return VaccineModel.fromJson(json.decode(response.body));
      }
    } on TimeoutException {
      throw Exception("Timeout... ");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

    Future<VaccineModel> createPetVaccine(
    // String token,

      String petId,
      String vaccineId,
      DateTime date,
      String clinic,

  ) async {
    try {
      var url = Uri.parse(
      'https://comnets.arabulucuyuz.net/petapi/v1/PetVaccine/CreatePetVaccineWithPetId'
      );
    
      final http.Response response = await http
          .post(
            url,
            headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer $token",
      },
            body: jsonEncode({
            
              "petId": petId,
              "vaccineId": vaccineId,
              "date": date.toUtc().toIso8601String(),
              "clinic": clinic,
              
              // "petId": 0,
              // "vaccineId": 0,
              // "date": "2023-07-31T17:43:54.995Z",
              // "clinic": "string"
              


}
            ),
          )
          .timeout(const Duration(seconds: 60));
     // print(response.body);
      switch (response.statusCode) {
        case 200:
          return VaccineModel.fromRawJson(response.body);
          
        default:
          return VaccineModel.fromJson(json.decode(response.body));
      }
    } on TimeoutException {
      throw Exception("Timeout... ");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}
