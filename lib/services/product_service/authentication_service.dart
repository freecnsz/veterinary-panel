import 'dart:convert' as convert;
import 'dart:io';
import 'package:flutter_boilerplate/api_urls.dart';
import 'package:flutter_boilerplate/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthenticateService {
  Future<UserModel> login(String email, String password) async {
    try {
      var url = Uri.parse(
        APIUrls.authentication,
      );

      // Await the http get response, then decode the json-formatted response.
      var response = await http.post(url,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: convert.jsonEncode(<String, dynamic>{
            "email": email,
            "password": password,
          }));

      // Check if the response is 200 and return the user
      if (response.statusCode == 200) {
        var user = UserModel.fromRawJson(response.body);
        return user;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
