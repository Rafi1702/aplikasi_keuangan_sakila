import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:sakila_store_project/core/helper/shared_pref.dart';
import 'package:sakila_store_project/network/api_client.dart';
import 'package:sakila_store_project/services/exception.dart';

class AuthService {
  Future<void> login({required String email, required String password}) async {
    try {
      final response = await HttpClient.client
          .post(
            Uri.parse('${HttpClient.API_URL}/login'),
            body: jsonEncode(
              {"email": email, "password": password},
            ),
          )
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        SharedPref.saveCookie(cookie: response.headers['set-cookie']!);
      }
      if (response.statusCode == 401) {
        throw CustomException(jsonDecode(response.body)['message']);
      }
    } on SocketException {
      throw CustomException("No Internet Connection");
    } on TimeoutException {
      throw CustomException('Waktu Habis');
    }
  }
}
