import 'dart:async';
import 'package:flutter_boilerplate/models/get_pets_model.dart';
import 'package:http/http.dart' as http;

class PetService {
  //servislerde bu aşamada http url kullanılsın.
  //Bu güvensiz bir protokoldür. Bu yüzden http kullanılmamalıdır.
  //Ancak kendi bilgisayarımıza bağlanmamızdan bu durum önem arz etmez.

  //Base Model içinde bir liste döndürür. Bu liste içinde de Tenant yani şirketler bulunmaktadır.
  static Future<PetsModel> getPets(
    Map<String, String>? token,
  ) async {
    try {
      var url = Uri.parse(
          "https://comnets.arabulucuyuz.net/petapi/v1/Pet/GetAllPetsOfAuthenticatedPetOwner");
      final http.Response response = await http
          .get(
            url,
            headers: token,
          )
          .timeout(const Duration(seconds: 60));
      switch (response.statusCode) {
        case 200:
          return PetsModel.fromRawJson(response.body);
        default:
          return PetsModel.fromRawJson(response.body);
      }
    } on TimeoutException {
      throw Exception("Timeout... ");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
