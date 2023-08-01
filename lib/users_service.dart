import 'dart:async';
import 'dart:io';
import 'package:flutter_boilerplate/user_model.dart';
import 'package:http/http.dart' as http;

class UsersService {
  static Map<String, String> token = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader:
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1NDUyNzAxMjEzIiwianRpIjoiYTliZmNlOGYtYTRkOC00NjVhLWI3ZjItNGZlYjhhZTRhYTUzIiwiZW1haWwiOiJtZWhtZXRhZG1pbkBnbWFpbC5jb20iLCJ1aWQiOiIyMGMzNDk1OS04MTIyLTRiM2EtYmU0OC1mNTlhYTY3MmRkZmUiLCJpcCI6IjE5Mi4xNjguNDMuMTMzIiwicm9sZXMiOiJTdXBlckFkbWluIiwiZXhwIjoxNjkyMDI4NzU2LCJpc3MiOiJDb3JlSWRlbnRpdHkiLCJhdWQiOiJDb3JlSWRlbnRpdHlVc2VyIn0.B83JSqMK38WqS24QfRD6Tw4cs8gWrRXeHeLjoAuaKTQ'
  };

  static Future<User> getUser() async {
    try {
      var url = Uri.parse(
          'https://comnets.arabulucuyuz.net/petapi/v1/FinancialAccount/GetFinancialAccounts');
      final http.Response response = await http
          .get(
            url,
            headers: token,
          )
          .timeout(const Duration(seconds: 60));

      switch (response.statusCode) {
        case 200:
          return User.fromRawJson(response.body);

        default:
          return User.fromRawJson(response.body);
      }
    } on TimeoutException {
      throw Exception("Timeout... ");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
